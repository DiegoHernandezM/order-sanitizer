<?php

use Illuminate\Support\Facades\Route;
use App\Models\MarketplaceStatus;
use App\Http\Controllers\Api\Sanborns\SanbornsImportController;

Route::get('/', function () {
    return view('welcome');
});


Route::view('/sanitizer', 'sanitizer.index');

Route::view('/', 'welcome');
Route::get('/sanborns/status-sanitizer', function () {
    return view('status-sanitizer.index-sanborns');
})->name('sanborns.status-sanitizer');

Route::get('/sanborns/assign-partida', [SanbornsImportController::class, 'assignPartida']);

Route::get('/sears/status-sanitizer', function () {
    return view('status-sanitizer.index-sears');
})->name('sears.status-sanitizer');
