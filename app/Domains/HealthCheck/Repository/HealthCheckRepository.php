<?php

namespace App\Domains\HealthCheck\Repository;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class HealthCheckRepository implements HealthCheckRepositoryInterface
{

    public function isDbConnected(): bool
    {
        try {
            DB::connection()->getPdo();
        } catch (\Exception $e) {
            Log::error('isDbConnected: ' . $e->getMessage());
            return false;
        }

        return true;
    }
}
