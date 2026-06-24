<?php

namespace App\Services\Sears;

use Illuminate\Support\Facades\DB;

class SearsAnalyzeService
{
    public function analyze(array $orders): array
    {
        $statuses = DB::table('marketplace_statuses')
            ->where('marketplace', 'sears')
            ->pluck('name', 'external_id')
            ->toArray();

        $rows = DB::connection('sears')
            ->table('pedidos as p')
            ->join('relacion_estatus_productos as rep', 'rep.num_pedido', '=', 'p.Num_pedido')
            ->join('relacion_pedidos as rp', 'rp.id', '=', 'rep.relacion_pedido')
            ->whereIn('p.Num_pedido', $orders)
            ->select([
                'p.Num_pedido',
                'p.Estatus',
                'rep.id_relacion',
                'rep.estatus_producto',
                'rp.id as item_id',
                'rp.Producto',
                'rp.Nombre_producto',
            ])
            ->get();

        $result = [];

        foreach ($rows->groupBy('Num_pedido') as $orderNumber => $items) {
            $first = $items->first();

            $result[] = [
                'order_number' => (int) $orderNumber,
                'order_status' => [
                    'id' => (int) $first->Estatus,
                    'name' => $statuses[$first->Estatus] ?? 'Unknown',
                ],
                'items_count' => $items->count(),
                'items' => $items->map(function ($item) use ($statuses) {
                    return [
                        'relation_status_id' => (int) $item->id_relacion,
                        'item_id' => (int) $item->item_id,
                        'product_id' => (int) $item->Producto,
                        'product_name' => $item->Nombre_producto,
                        'item_status' => [
                            'id' => (int) $item->estatus_producto,
                            'name' => $statuses[$item->estatus_producto] ?? 'Unknown',
                        ],
                    ];
                })->values()->toArray(),
            ];
        }

        return $result;
    }
}
