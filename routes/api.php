<?php

use App\Http\Controllers\MetricController;
use Illuminate\Support\Facades\Route;

Route::get('/metrics', [MetricController::class, 'paginate']);
Route::post('/metrics', [MetricController::class, 'store']);