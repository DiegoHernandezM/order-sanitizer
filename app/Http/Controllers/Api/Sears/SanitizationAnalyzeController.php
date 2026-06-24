<?php

namespace App\Http\Controllers\Api\Sears;

use App\Http\Controllers\Controller;
use App\Services\Sears\SearsAnalyzeService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class SanitizationAnalyzeController extends Controller
{
    public function __construct(
        private readonly SearsAnalyzeService $service
    ) {}

    public function store(Request $request): JsonResponse
    {
        $validated = $request->validate([
            'orders' => ['required', 'array', 'min:1'],
            'orders.*' => ['required', 'integer'],
        ]);

        $result = $this->service->analyze($validated['orders']);

        return response()->json([
            'data' => $result,
        ]);
    }
}