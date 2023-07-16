<?php

use App\Domains\HealthCheck\Http\Controllers\HealthCheckController;

Route::prefix('api')->group(function (): void {
    Route::get('/', [HealthCheckController::class, 'index']);
});
