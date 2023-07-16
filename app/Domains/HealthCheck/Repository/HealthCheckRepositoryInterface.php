<?php

declare(strict_types=1);

namespace App\Domains\HealthCheck\Repository;

interface HealthCheckRepositoryInterface
{
    public function isDbConnected(): bool;
}
