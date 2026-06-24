<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Status;
use Illuminate\Support\Facades\DB;

class StatusSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('statuses')->upsert([
            ['id' => 0, 'name' => 'Pendientes', 'sort_order' => 1, 'is_visible' => true],
            ['id' => 1, 'name' => 'Pago por confirmar', 'sort_order' => 2, 'is_visible' => true],
            ['id' => 2, 'name' => 'En espera de documentos', 'sort_order' => 3, 'is_visible' => true],
            ['id' => 3, 'name' => 'Embarcado', 'sort_order' => 4, 'is_visible' => true],
            ['id' => 4, 'name' => 'Entregado', 'sort_order' => 5, 'is_visible' => true],
            ['id' => 5, 'name' => 'Procesando pedido', 'sort_order' => 6, 'is_visible' => false],
            ['id' => 6, 'name' => 'Liberado', 'sort_order' => 7, 'is_visible' => true],
            ['id' => 7, 'name' => 'Cancelado', 'sort_order' => 8, 'is_visible' => true],
            ['id' => 8, 'name' => 'TDC rechazada', 'sort_order' => 9, 'is_visible' => true],
            ['id' => 9, 'name' => 'Por embarcar', 'sort_order' => 10, 'is_visible' => true],
            ['id' => 10, 'name' => 'Pago no recibido por Paypal', 'sort_order' => 11, 'is_visible' => true],
            ['id' => 11, 'name' => 'Pago recibido en Paypal NO VERIFICADO', 'sort_order' => 12, 'is_visible' => true],
            ['id' => 12, 'name' => 'Esperando deposito del cliente', 'sort_order' => 13, 'is_visible' => true],
            ['id' => 13, 'name' => 'Pedido de prueba', 'sort_order' => 14, 'is_visible' => true],
            ['id' => 14, 'name' => 'Recogera en nuestras oficinas', 'sort_order' => 15, 'is_visible' => false],
            ['id' => 15, 'name' => 'Por realizar cargo con tarjeta', 'sort_order' => 16, 'is_visible' => false],
            ['id' => 16, 'name' => 'Por embarcar con Proveedor', 'sort_order' => 17, 'is_visible' => true],
            ['id' => 17, 'name' => 'Solicita rembolso', 'sort_order' => 18, 'is_visible' => true],
            ['id' => 18, 'name' => 'Fraude', 'sort_order' => 19, 'is_visible' => true],
            ['id' => 19, 'name' => 'Rembolso realizado', 'sort_order' => 20, 'is_visible' => true],
            ['id' => 20, 'name' => 'Rembolso autorizado', 'sort_order' => 21, 'is_visible' => true],
            ['id' => 21, 'name' => 'En Aclaracion', 'sort_order' => 22, 'is_visible' => true],
            ['id' => 22, 'name' => 'Parcialmente surtido', 'sort_order' => 23, 'is_visible' => true],
            ['id' => 23, 'name' => 'Importacion en proceso', 'sort_order' => 24, 'is_visible' => false],
            ['id' => 24, 'name' => 'Entregado n/conf', 'sort_order' => 25, 'is_visible' => false],
            ['id' => 25, 'name' => 'Sin permiso', 'sort_order' => 26, 'is_visible' => false],
            ['id' => 26, 'name' => 'Pendiente facebook', 'sort_order' => 27, 'is_visible' => false],
            ['id' => 27, 'name' => 'Esperando Safetypay', 'sort_order' => 28, 'is_visible' => true],
            ['id' => 28, 'name' => 'fraude_comprobado', 'sort_order' => 29, 'is_visible' => false],
            ['id' => 29, 'name' => 'Pago no aceptado por banco(IF)', 'sort_order' => 30, 'is_visible' => false],
            ['id' => 31, 'name' => 'Pago NO recibido en Bancanet', 'sort_order' => 31, 'is_visible' => true],
            ['id' => 32, 'name' => 'Esperando confirmacion cliente', 'sort_order' => 32, 'is_visible' => true],

            // ... continúa con todos los demás ...

            ['id' => 106, 'name' => 'En Disputa', 'sort_order' => 106, 'is_visible' => true],
            ['id' => 108, 'name' => 'Aprobar CYR', 'sort_order' => 108, 'is_visible' => true],
            ['id' => 110, 'name' => 'Solicita Devolución', 'sort_order' => 110, 'is_visible' => true],
            ['id' => 111, 'name' => 'Listo para recoger CYR', 'sort_order' => 111, 'is_visible' => true],
            ['id' => 112, 'name' => 'Enviado a tienda B', 'sort_order' => 112, 'is_visible' => true],
            ['id' => 113, 'name' => 'Devuelta en tienda', 'sort_order' => 113, 'is_visible' => true],
            ['id' => 114, 'name' => 'Retorno seller tienda', 'sort_order' => 114, 'is_visible' => true],
            ['id' => 115, 'name' => 'Devolución no Autorizada', 'sort_order' => 115, 'is_visible' => true],
            ['id' => 116, 'name' => 'Devolución Reembolsada', 'sort_order' => 116, 'is_visible' => true],
        ], ['id'], ['name', 'sort_order', 'is_visible']);
    }
}
