<?php

declare(strict_types=1);

namespace App\Domains\HealthCheck\Http\Controllers;

use App\Domains\HealthCheck\Repository\HealthCheckRepository;
use App\Domains\HealthCheck\Repository\HealthCheckRepositoryInterface;
use App\Http\Controllers\Controller;
use Illuminate\Http\JsonResponse;

class HealthCheckController extends Controller
{
    public function __construct(
        private readonly HealthCheckRepository $healthCheckRepository
    ) {
    }

    public function index(): JsonResponse
    {
        return $this->healthCheckRepository->isDbConnected()
            ? new JsonResponse(
                [
                    'type' => 'success',
                    'message' => 'success',
                ]
            )
            : new JsonResponse(
                [
                    'type' => 'error',
                    'message' => 'The app is not ready for connection.',
                ],
                500
            );
    }
}
