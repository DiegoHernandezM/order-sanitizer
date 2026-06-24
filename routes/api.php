<?php

use Illuminate\Support\Facades\Route;
use App\Models\MarketplaceStatus;

use App\Http\Controllers\Api\Sanborns\SanbornsImportController;
use App\Http\Controllers\Api\Sanborns\SanitizationAnalyzeController as SanbornsAnalyzeController;
use App\Http\Controllers\Api\Sanborns\SanitizationScriptController as SanbornsScriptController;

use App\Http\Controllers\Api\Sears\SearsImportController;
use App\Http\Controllers\Api\Sears\SanitizationAnalyzeController as SearsAnalyzeController;
use App\Http\Controllers\Api\Sears\SanitizationScriptController as SearsScriptController;

Route::prefix('sanborns')->group(function () {
    Route::get('/statuses', function () {
        return MarketplaceStatus::query()
            ->where('marketplace', 'sanborns')
            ->where('visible', true)
            ->orderBy('sort_order')
            ->get([
                'external_id as id',
                'name',
                'sort_order',
                'visible',
            ]);
    });

    Route::post('/import', [SanbornsImportController::class, 'store']);
    Route::post('/sanitizations/analyze', [SanbornsAnalyzeController::class, 'store']);
    Route::post('/sanitizations/generate-script', [SanbornsScriptController::class, 'store']);

    Route::post('/assign-partida/import', [SanbornsImportController::class, 'importAssignPartida']);
    Route::post('/assign-partida/analyze', [SanbornsImportController::class, 'analyzeAssignPartida']);
    Route::post('/assign-partida/execute', [SanbornsImportController::class, 'executeAssignPartida']);
});

Route::prefix('sears')->group(function () {
    Route::get('/statuses', function () {
        return MarketplaceStatus::query()
            ->where('marketplace', 'sears')
            ->where('visible', true)
            ->orderBy('sort_order')
            ->get([
                'external_id as id',
                'name',
                'sort_order',
                'visible',
            ]);
    });

    Route::post('/import', [SearsImportController::class, 'store']);
    Route::post('/sanitizations/analyze', [SearsAnalyzeController::class, 'store']);
    Route::post('/sanitizations/generate-script', [SearsScriptController::class, 'store']);
});
