<?php

namespace App\Services\Sears;

use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use RuntimeException;

class SearsImportService
{
    public function importFromProd(array $numerosPedido): array
    {
        $numerosPedido = collect($numerosPedido)
            ->unique()
            ->values()
            ->all();

        $pedidos = DB::connection('prod-se')
            ->table('pedidos')
            ->whereIn('Num_pedido', $numerosPedido)
            ->get();

        if ($pedidos->isEmpty()) {
            throw new RuntimeException('No se encontraron pedidos en PROD Sears.');
        }

        $estatusProductos = DB::connection('prod-se')
            ->table('relacion_estatus_productos')
            ->whereIn('num_pedido', $numerosPedido)
            ->get();

        $relacionPedidoIds = $estatusProductos
            ->pluck('relacion_pedido')
            ->filter()
            ->unique()
            ->values()
            ->all();

        $relacionPedidos = DB::connection('prod-se')
            ->table('relacion_pedidos')
            ->whereIn('id', $relacionPedidoIds)
            ->get();

        return DB::connection('sears')->transaction(function () use (
            $pedidos,
            $relacionPedidos,
            $estatusProductos
        ) {
            $this->upsertCollection('pedidos', $pedidos, ['Num_pedido']);

            $this->upsertCollection('relacion_pedidos', $relacionPedidos, ['id']);

            $this->upsertCollection(
                'relacion_estatus_productos',
                $estatusProductos,
                ['id_relacion']
            );

            return [
                'pedidos_importados' => $pedidos->count(),
                'relacion_pedidos_importados' => $relacionPedidos->count(),
                'relacion_estatus_productos_importados' => $estatusProductos->count(),
            ];
        });
    }

    private function upsertCollection(string $table, Collection $rows, array $uniqueBy): void
    {
        if ($rows->isEmpty()) {
            return;
        }

        $searsColumns = DB::connection('sears')
            ->getSchemaBuilder()
            ->getColumnListing($table);

        $records = $rows
            ->map(function ($row) use ($searsColumns) {
                return collect((array) $row)
                    ->only($searsColumns)
                    ->toArray();
            })
            ->values()
            ->all();

        $updateColumns = array_values(array_diff(
            array_keys($records[0]),
            $uniqueBy
        ));

        DB::connection('sears')
            ->table($table)
            ->upsert(
                $records,
                $uniqueBy,
                $updateColumns
            );
    }
}