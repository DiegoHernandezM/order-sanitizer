<?php

namespace App\Http\Controllers\Api\Sanborns;

use App\Http\Controllers\Controller;
use App\Services\SanitizationAnalyzeService;
use Illuminate\Http\Request;

class SanitizationAnalyzeController extends Controller
{
    public function __construct(
        private readonly SanitizationAnalyzeService $service
    ) {}

    public function store(Request $request)
    {
        $validated = $request->validate([
            'orders' => ['required', 'array'],
            'orders.*' => ['integer']
        ]);

        return response()->json([
            'data' => $this->service->analyze(
                $validated['orders']
            )
        ]);
    }
}
