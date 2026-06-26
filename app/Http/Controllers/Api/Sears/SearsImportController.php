<?php

namespace App\Http\Controllers\Api\Sears;

use App\Http\Controllers\Controller;
use App\Services\Sears\SearsImportService;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;

class SearsImportController extends Controller
{
    public function __construct(
        private readonly SearsImportService $searsImportService
    ) {}

    public function store(Request $request): JsonResponse
    {
        $validated = $request->validate([
            'pedidos' => ['required', 'array', 'min:1'],
            'pedidos.*' => ['required', 'integer'],
        ]);

        $result = $this->searsImportService->importFromProd(
            $validated['pedidos']
        );

        return response()->json([
            'message' => 'Importación desde PROD completada correctamente',
            'data' => $result,
        ]);
    }

    public function assignPartida()
    {
        return view('sears.assign-partida');
    }

    public function importAssignPartida(Request $request)
    {
        $request->validate([
            'orders' => ['required', 'string'],
        ]);

        $orders = $this->parseOrders($request->orders);

        foreach ($orders as $orderNumber) {
            $this->importOrderAssignPartidaFromProd($orderNumber);
        }

        return response()->json([
            'success' => true,
            'message' => 'Pedidos importados correctamente desde PROD.',
            'orders' => $orders,
        ]);
    }

    public function executeAssignPartida(Request $request)
    {
        $request->validate([
            'items' => ['required', 'array'],
            'items.*.order_number' => ['required'],
            'items.*.relation_id' => ['required'],
            'items.*.dispatch_store' => ['required'],
            'config.storeHeader' => ['required'],
            'config.bearerToken' => ['required'],
        ]);

        $config = $request->input('config');
        $items = collect($request->input('items'))->groupBy('order_number');

        $authorization = trim($config['bearerToken']);

        if (!str_starts_with(strtolower($authorization), 'bearer ')) {
            $authorization = 'Bearer ' . $authorization;
        }

        $results = [];

        foreach ($items as $orderNumber => $orderItems) {
            $payload = [
                'products' => $orderItems->map(fn($item) => [
                    'relationId' => (int) $item['relation_id'],
                    'exist' => true,
                    'shipmentType' => $config['shipmentType'] ?? 'ME',
                    'dispatchStore' => (int) $item['dispatch_store'],
                    'km' => (float) ($config['km'] ?? 5.9),
                    'orden' => (int) ($config['orden'] ?? 2),
                ])->values()->toArray(),
                'insertable' => (bool) ($config['insertable'] ?? true),
            ];

            $pcResponse = Http::withHeaders([
                'Content-Type' => 'application/json',
                'Accept' => 'application/json',
                'store' => $config['storeHeader'],
                'Authorization' => $authorization,
            ])->post(
                "https://pcapi.plataforma-claro.com/pc/order/assignment/{$orderNumber}",
                $payload
            );

            $rawBody = $pcResponse->body();
            $jsonBody = json_decode($rawBody, true);

            $results[] = [
                'order_number' => $orderNumber,
                'payload' => $payload,
                'status' => $pcResponse->status(),
                'success' => $pcResponse->successful() && is_array($jsonBody) && ($jsonBody['success'] ?? false),
                'response' => $jsonBody ?: [
                    'raw' => $rawBody,
                ],
            ];

            usleep(300000);
        }

        return response()->json([
            'success' => true,
            'message' => 'Asignación ejecutada en PC.',
            'results' => $results,
        ]);
    }

    public function analyzeAssignPartida(Request $request)
    {
        $request->validate([
            'orders' => ['required', 'string'],
        ]);

        $orders = $this->parseOrders($request->orders);

        $items = DB::connection('sears')
            ->table('relacion_pedidos')
            ->join('productos', 'relacion_pedidos.Producto', '=', 'productos.Id')
            ->leftJoin('tienda', 'tienda.Id', '=', 'relacion_pedidos.Tienda')
            ->whereIn('relacion_pedidos.Pedido', $orders)
            ->where('relacion_pedidos.habilitado', 's')
            ->select([
                'relacion_pedidos.Pedido as order_number',
                'relacion_pedidos.id as relation_id',
                'relacion_pedidos.Nombre_producto as product_name',
                'tienda.Nombre as store_name',
                DB::raw("(
                SELECT rep.estatus_producto
                FROM relacion_estatus_productos rep
                WHERE rep.num_pedido = relacion_pedidos.Pedido
                  AND (
                        rep.id_relacion = relacion_pedidos.id
                        OR rep.relacion_pedido = relacion_pedidos.id
                  )
                LIMIT 1
            ) as status_id"),
                DB::raw("(
                SELECT tt.id_tienda
                FROM transferencias_tiendas tt
                WHERE tt.relacion_pedido = relacion_pedidos.Id
                ORDER BY tt.fecha_alta DESC
                LIMIT 1
            ) as dispatch_store"),
                DB::raw("(
                SELECT tt.estatus
                FROM transferencias_tiendas tt
                WHERE tt.relacion_pedido = relacion_pedidos.Id
                ORDER BY tt.fecha_alta DESC
                LIMIT 1
            ) as transfer_status"),
            ])
            ->orderBy('relacion_pedidos.Pedido')
            ->orderBy('relacion_pedidos.id')
            ->get();

        $autoAssignableRows = DB::connection('sears')
            ->table('relacion_pedidos as pantalla')
            ->join('relacion_estatus_productos as rep', function ($join) {
                $join->on('rep.num_pedido', '=', 'pantalla.Pedido')
                    ->where(function ($q) {
                        $q->whereColumn('rep.id_relacion', 'pantalla.id')
                            ->orWhereColumn('rep.relacion_pedido', 'pantalla.id');
                    });
            })
            ->leftJoin('transferencias_tiendas as tt_pantalla', 'tt_pantalla.relacion_pedido', '=', 'pantalla.id')
            ->join('relacion_pedidos as partida_ref', function ($join) {
                $join->on('partida_ref.Pedido', '=', 'pantalla.Pedido')
                    ->whereColumn('partida_ref.id', '<>', 'pantalla.id');
            })
            ->join('transferencias_tiendas as tt_ref', 'tt_ref.relacion_pedido', '=', 'partida_ref.id')
            ->whereIn('pantalla.Pedido', $orders)
            ->where('pantalla.habilitado', 's')
            ->where('partida_ref.habilitado', 's')
            ->where('pantalla.Nombre_producto', 'LIKE', '%Pantalla%')
            ->where('rep.estatus_producto', 16)
            ->whereNull('tt_pantalla.id_tienda')
            ->whereNotNull('tt_ref.id_tienda')
            ->select([
                'pantalla.Pedido as order_number',
                'pantalla.id as screen_relation_id',
                'pantalla.Nombre_producto as screen_product_name',
                'rep.estatus_producto as status_id',
                'partida_ref.id as reference_relation_id',
                'partida_ref.Nombre_producto as reference_product_name',
                'tt_ref.id_tienda as suggested_store',
            ])
            ->orderBy('pantalla.Pedido')
            ->orderBy('pantalla.id')
            ->get();

        $autoAssignables = $autoAssignableRows
            ->groupBy('screen_relation_id')
            ->map(function ($rows) {
                $first = $rows->first();

                return [
                    'order_number' => $first->order_number,
                    'screen_relation_id' => $first->screen_relation_id,
                    'screen_product_name' => $first->screen_product_name,
                    'status_id' => $first->status_id,
                    'suggested_store' => $first->suggested_store,
                    'reference_items' => $rows->map(function ($row) {
                        return [
                            'relation_id' => $row->reference_relation_id,
                            'product_name' => $row->reference_product_name,
                            'store_id' => $row->suggested_store,
                        ];
                    })->values(),
                ];
            })
            ->values();
        

        return response()->json([
            'success' => true,
            'items' => $items,
            'auto_assignables' => $autoAssignables,
        ]);
    }

    private function parseOrders(string $orders): \Illuminate\Support\Collection
    {
        return collect(preg_split('/[\s,;]+/', $orders))
            ->map(fn($order) => trim($order))
            ->filter()
            ->unique()
            ->values();
    }

    private function importOrderAssignPartidaFromProd($orderNumber): void
    {
        $items = DB::connection('prod')
            ->table('relacion_pedidos')
            ->where('Pedido', $orderNumber)
            ->where('habilitado', 's')
            ->get();

        foreach ($items as $item) {
            DB::connection('sears')
                ->table('relacion_pedidos')
                ->updateOrInsert(
                    ['id' => $item->id],
                    (array) $item
                );
        }

        $productIds = $items->pluck('Producto')->filter()->unique();

        if ($productIds->isNotEmpty()) {
            $products = DB::connection('prod')
                ->table('productos')
                ->whereIn('Id', $productIds)
                ->get();

            foreach ($products as $product) {
                DB::connection('sears')
                    ->table('productos')
                    ->updateOrInsert(
                        ['Id' => $product->Id],
                        (array) $product
                    );
            }
        }

        $storeIds = $items->pluck('Tienda')->filter()->unique();

        if ($storeIds->isNotEmpty()) {
            $stores = DB::connection('prod')
                ->table('tienda')
                ->whereIn('Id', $storeIds)
                ->get();

            foreach ($stores as $store) {
                DB::connection('sears')
                    ->table('tienda')
                    ->updateOrInsert(
                        ['Id' => $store->Id],
                        (array) $store
                    );
            }
        }

        $relationIds = $items->pluck('id')->filter()->unique();

        if ($relationIds->isNotEmpty()) {
            $transfers = DB::connection('prod')
                ->table('transferencias_tiendas')
                ->whereIn('relacion_pedido', $relationIds)
                ->get();

            foreach ($transfers as $transfer) {
                DB::connection('sears')
                    ->table('transferencias_tiendas')
                    ->updateOrInsert(
                        ['id_transferencia' => $transfer->id_transferencia],
                        (array) $transfer
                    );
            }
        }

        $statusProducts = DB::connection('prod')
            ->table('relacion_estatus_productos')
            ->where('num_pedido', $orderNumber)
            ->get();

        foreach ($statusProducts as $status) {
            DB::connection('sears')
                ->table('relacion_estatus_productos')
                ->updateOrInsert(
                    [
                        'num_pedido' => $status->num_pedido,
                        'id_relacion' => $status->id_relacion,
                    ],
                    (array) $status
                );
        }
    }
}
