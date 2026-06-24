<?php

namespace App\Http\Controllers\Api\Sears;

use App\Http\Controllers\Controller;
use App\Services\Sears\SearsImportService;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;

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
}
