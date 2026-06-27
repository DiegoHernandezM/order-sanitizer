<?php

namespace App\Services\Sanborns;

use Illuminate\Support\Facades\DB;
use InvalidArgumentException;

class SanitizationScriptService
{
    public function generate(array $sanitizations): string
    {
        $blocks = [];

        $blocks[] = 'use tienda;';
        $blocks[] = 'set foreign_key_checks = 0;';
        $blocks[] = '';

        foreach ($sanitizations as $sanitization) {
            $blocks[] = $this->generateOrderBlock($sanitization);
            $blocks[] = '';
        }

        $blocks[] = 'set foreign_key_checks = 1;';

        return implode(PHP_EOL, $blocks);
    }

    private function generateOrderBlock(array $sanitization): string
    {
        $orderNumber = (int) $sanitization['order_number'];
        $itemStatus = (int) $sanitization['item_status'];
        $userId = (int) $sanitization['user_id'];
        $comment = $this->escapeSqlString($sanitization['comment']);

        $relationIds = collect($sanitization['items'])
            ->map(fn($id) => (int) $id)
            ->unique()
            ->values()
            ->all();

        $relations = DB::connection('sanborns')
            ->table('relacion_estatus_productos as rep')
            ->join('relacion_pedidos as rp', 'rp.id', '=', 'rep.relacion_pedido')
            ->where('rep.num_pedido', $orderNumber)
            ->whereIn('rep.id_relacion', $relationIds)
            ->select([
                'rep.id_relacion',
                'rep.relacion_pedido',
                'rp.id as item_id',
            ])
            ->orderBy('rep.id_relacion')
            ->get();

        if ($relations->count() !== count($relationIds)) {
            throw new InvalidArgumentException(
                "No se encontraron todas las partidas seleccionadas para el pedido {$orderNumber}."
            );
        }

        $idRelacionList = $relations
            ->pluck('id_relacion')
            ->implode(',');

        $historialValues = $relations
            ->map(function ($relation) use ($orderNumber, $itemStatus, $userId) {
                return sprintf(
                    "(%d, %d, '%d', '%d', now())",
                    $orderNumber,
                    $relation->id_relacion,
                    $itemStatus,
                    $userId
                );
            })
            ->implode(',' . PHP_EOL);

        $sql = [];

        $sql[] = "-- Pedido {$orderNumber}";

        $sql[] = sprintf(
            'UPDATE relacion_estatus_productos SET estatus_producto = %d WHERE id_relacion IN (%s) AND num_pedido = %d;',
            $itemStatus,
            $idRelacionList,
            $orderNumber
        );

        $sql[] = 'INSERT INTO historial_estatus_productos (num_pedido, id_relacion_pedido, estatus_producto, id_usuario, fecha_registro) VALUES';
        $sql[] = $historialValues . ';';

        if ($sanitization['update_order_status'] === true) {
            $orderStatus = (int) ($sanitization['order_status'] ?? $itemStatus);

            $sql[] = sprintf(
                'UPDATE pedidos SET Estatus = %d WHERE Num_pedido = %d;',
                $orderStatus,
                $orderNumber
            );
        }

        $sql[] = sprintf(
            "INSERT INTO comentarios_pedidos (numero_pedido, Fecha, Comentario, usuario, visible, id_usuario, nivel, frontend) VALUES (%d, NOW(), '%s', NULL, '1', '%d', '1', '1');",
            $orderNumber,
            $comment,
            $userId
        );

        return implode(PHP_EOL, $sql);
    }

    private function escapeSqlString(string $value): string
    {
        return str_replace("'", "''", $value);
    }
}
