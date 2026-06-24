<?php

namespace App\Http\Controllers\Api\Sears;

use App\Http\Controllers\Controller;
use App\Services\Sears\SearsScriptService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class SanitizationScriptController extends Controller
{
    public function __construct(
        private readonly SearsScriptService $service
    ) {}

    public function store(Request $request): JsonResponse
    {
        $validated = $request->validate([
            'sanitizations' => ['required', 'array', 'min:1'],

            'sanitizations.*.order_number' => ['required', 'integer'],
            'sanitizations.*.item_status' => ['required', 'integer'],
            'sanitizations.*.update_order_status' => ['required', 'boolean'],
            'sanitizations.*.order_status' => ['nullable', 'integer'],
            'sanitizations.*.user_id' => ['required', 'integer'],
            'sanitizations.*.comment' => ['required', 'string'],
            'sanitizations.*.items' => ['required', 'array', 'min:1'],
            'sanitizations.*.items.*' => ['required', 'integer'],
        ]);

        $sql = $this->service->generate($validated['sanitizations']);

        return response()->json([
            'message' => 'Script Sears generado correctamente',
            'sql' => $sql,
        ]);
    }
}