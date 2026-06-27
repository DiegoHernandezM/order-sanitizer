<?php

namespace App\Services\Sanborns;

use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use RuntimeException;

class SanbornsImportService
{
    public function importFromProd(array $numerosPedido): array
    {
        $numerosPedido = collect($numerosPedido)
            ->unique()
            ->values()
            ->all();

        $pedidos = DB::connection('prod')
            ->table('pedidos')
            ->whereIn('Num_pedido', $numerosPedido)
            ->get();

        if ($pedidos->isEmpty()) {
            throw new RuntimeException('No se encontraron pedidos en PROD.');
        }

        $estatusProductos = DB::connection('prod')
            ->table('relacion_estatus_productos')
            ->whereIn('num_pedido', $numerosPedido)
            ->get();

        $relacionPedidoIds = $estatusProductos
            ->pluck('relacion_pedido')
            ->filter()
            ->unique()
            ->values()
            ->all();

        $relacionPedidos = DB::connection('prod')
            ->table('relacion_pedidos')
            ->whereIn('id', $relacionPedidoIds)
            ->get();

        return DB::connection('sanborns')->transaction(function () use (
            $pedidos,
            $relacionPedidos,
            $estatusProductos
        ) {
            $this->upsertCollection('pedidos', $pedidos, ['Num_pedido']);
            $this->upsertCollection('relacion_pedidos', $relacionPedidos, ['id']);
            $this->upsertCollection('relacion_estatus_productos', $estatusProductos, ['id_relacion']);

            return [
                'pedidos_importados' => $pedidos->count(),
                'relacion_pedidos_importados' => $relacionPedidos->count(),
                'relacion_estatus_productos_importados' => $estatusProductos->count(),
            ];
        });
    }

    public function importAssignPartidaFromProd(string $orders): Collection
    {
        $orders = $this->parseOrders($orders);

        foreach ($orders as $orderNumber) {
            $this->importOrderAssignPartidaFromProd($orderNumber);
        }

        return $orders;
    }

    public function executeAssignPartida(array $items, array $config): array
    {
        $groupedItems = collect($items)->groupBy('order_number');
        $results = [];

        foreach ($groupedItems as $orderNumber => $orderItems) {
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
                'Authorization' => 'Bearer ' . trim($config['bearerToken']),
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
                'success' => $pcResponse->successful()
                    && is_array($jsonBody)
                    && ($jsonBody['success'] ?? false),
                'response' => $jsonBody ?: [
                    'raw' => $rawBody,
                ],
            ];
        }

        return $results;
    }

    public function analyzeAssignPartida(string $orders): array
    {
        $orders = $this->parseOrders($orders);

        $items = DB::connection('sanborns')
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
                    WHERE rep.relacion_pedido = relacion_pedidos.id
                      AND rep.num_pedido = relacion_pedidos.Pedido
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

        $autoAssignableRows = DB::connection('sanborns')
            ->table('relacion_pedidos as pantalla')
            ->join('relacion_estatus_productos as rep', function ($join) {
                $join->on('rep.num_pedido', '=', 'pantalla.Pedido')
                    ->where(function ($q) {
                        $q->whereColumn('rep.id_relacion', 'pantalla.id')
                            ->orWhereColumn('rep.relacion_pedido', 'pantalla.id');
                    });
            })
            ->leftJoin(
                'transferencias_tiendas as tt_pantalla',
                'tt_pantalla.relacion_pedido',
                '=',
                'pantalla.id'
            )
            ->join('relacion_pedidos as partida_ref', function ($join) {
                $join->on('partida_ref.Pedido', '=', 'pantalla.Pedido')
                    ->whereColumn('partida_ref.id', '<>', 'pantalla.id');
            })
            ->join(
                'transferencias_tiendas as tt_ref',
                'tt_ref.relacion_pedido',
                '=',
                'partida_ref.id'
            )
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
                    'reference_items' => $rows->map(fn($row) => [
                        'relation_id' => $row->reference_relation_id,
                        'product_name' => $row->reference_product_name,
                        'store_id' => $row->suggested_store,
                    ])->values(),
                ];
            })
            ->values();

        return [
            'items' => $items,
            'auto_assignables' => $autoAssignables,
        ];
    }

    private function parseOrders(string $orders): Collection
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
            DB::connection('sanborns')
                ->table('relacion_pedidos')
                ->updateOrInsert(['id' => $item->id], (array) $item);
        }

        $this->importProducts($items);
        $this->importStores($items);
        $this->importTransfers($items);
        $this->importStatusProducts($orderNumber);
    }

    private function importProducts(Collection $items): void
    {
        $productIds = $items->pluck('Producto')->filter()->unique();

        if ($productIds->isEmpty()) {
            return;
        }

        $products = DB::connection('prod')
            ->table('productos')
            ->whereIn('Id', $productIds)
            ->get();

        foreach ($products as $product) {
            DB::connection('sanborns')
                ->table('productos')
                ->updateOrInsert(['Id' => $product->Id], (array) $product);
        }
    }

    private function importStores(Collection $items): void
    {
        $storeIds = $items->pluck('Tienda')->filter()->unique();

        if ($storeIds->isEmpty()) {
            return;
        }

        $stores = DB::connection('prod')
            ->table('tienda')
            ->whereIn('Id', $storeIds)
            ->get();

        foreach ($stores as $store) {
            DB::connection('sanborns')
                ->table('tienda')
                ->updateOrInsert(['Id' => $store->Id], (array) $store);
        }
    }

    private function importTransfers(Collection $items): void
    {
        $relationIds = $items->pluck('id')->filter()->unique();

        if ($relationIds->isEmpty()) {
            return;
        }

        $transfers = DB::connection('prod')
            ->table('transferencias_tiendas')
            ->whereIn('relacion_pedido', $relationIds)
            ->get();

        foreach ($transfers as $transfer) {
            DB::connection('sanborns')
                ->table('transferencias_tiendas')
                ->updateOrInsert(
                    ['id_transferencia' => $transfer->id_transferencia],
                    (array) $transfer
                );
        }
    }

    private function importStatusProducts($orderNumber): void
    {
        $statusProducts = DB::connection('prod')
            ->table('relacion_estatus_productos')
            ->where('num_pedido', $orderNumber)
            ->get();

        foreach ($statusProducts as $status) {
            DB::connection('sanborns')
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

    private function upsertCollection(string $table, Collection $rows, array $uniqueBy): void
    {
        if ($rows->isEmpty()) {
            return;
        }

        $sanbornsColumns = DB::connection('sanborns')
            ->getSchemaBuilder()
            ->getColumnListing($table);

        $records = $rows
            ->map(fn($row) => collect((array) $row)
                ->only($sanbornsColumns)
                ->toArray())
            ->values()
            ->all();

        $updateColumns = array_values(array_diff(
            array_keys($records[0]),
            $uniqueBy
        ));

        DB::connection('sanborns')
            ->table($table)
            ->upsert($records, $uniqueBy, $updateColumns);
    }
}
