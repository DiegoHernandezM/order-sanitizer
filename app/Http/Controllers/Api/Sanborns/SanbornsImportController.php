<?php

namespace App\Http\Controllers\Api\Sanborns;

use App\Http\Controllers\Controller;
use App\Services\Sanborns\SanbornsImportService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class SanbornsImportController extends Controller
{
    public function __construct(
        private readonly SanbornsImportService $sanbornsImportService
    ) {}

    public function store(Request $request): JsonResponse
    {
        $validated = $request->validate([
            'pedidos' => ['required', 'array', 'min:1'],
            'pedidos.*' => ['required', 'integer'],
        ]);

        $result = $this->sanbornsImportService->importFromProd(
            $validated['pedidos']
        );

        return response()->json([
            'success' => true,
            'message' => 'Importación desde PROD completada correctamente.',
            'data' => $result,
        ]);
    }

    public function assignPartida()
    {
        return view('sanborns.assign-partida');
    }

    public function importAssignPartida(Request $request): JsonResponse
    {
        $validated = $request->validate([
            'orders' => ['required', 'string'],
        ]);

        $orders = $this->sanbornsImportService->importAssignPartidaFromProd(
            $validated['orders']
        );

        return response()->json([
            'success' => true,
            'message' => 'Pedidos importados correctamente desde PROD.',
            'orders' => $orders,
        ]);
    }
}
