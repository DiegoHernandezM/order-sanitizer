<?php

namespace App\Http\Controllers\Api\Sears;

use App\Http\Controllers\Controller;
use App\Services\Sears\SearsImportService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

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
            'success' => true,
            'message' => 'Importación desde PROD Sears completada correctamente.',
            'data' => $result,
        ]);
    }

    public function assignPartida()
    {
        return view('sears.assign-partida');
    }

    public function importAssignPartida(Request $request): JsonResponse
    {
        $validated = $request->validate([
            'orders' => ['required', 'string'],
        ]);

        $orders = $this->searsImportService->importAssignPartidaFromProd(
            $validated['orders']
        );

        return response()->json([
            'success' => true,
            'message' => 'Pedidos Sears importados correctamente desde PROD.',
            'orders' => $orders,
        ]);
    }

    public function analyzeAssignPartida(Request $request): JsonResponse
    {
        $validated = $request->validate([
            'orders' => ['required', 'string'],
        ]);

        $result = $this->searsImportService->analyzeAssignPartida(
            $validated['orders']
        );

        return response()->json([
            'success' => true,
            'items' => $result['items'],
            'auto_assignables' => $result['auto_assignables'],
        ]);
    }

    public function executeAssignPartida(Request $request): JsonResponse
    {
        $validated = $request->validate([
            'items' => ['required', 'array'],
            'items.*.order_number' => ['required'],
            'items.*.relation_id' => ['required'],
            'items.*.dispatch_store' => ['required'],
            'config.storeHeader' => ['required'],
            'config.bearerToken' => ['required'],
        ]);

        $results = $this->searsImportService->executeAssignPartida(
            $validated['items'],
            $validated['config']
        );

        return response()->json([
            'success' => true,
            'message' => 'Asignación Sears ejecutada en PC.',
            'results' => $results,
        ]);
    }
}
