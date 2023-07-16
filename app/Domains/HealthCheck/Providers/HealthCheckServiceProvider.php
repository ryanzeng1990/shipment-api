<?php

declare(strict_types=1);

namespace App\Domains\HealthCheck\Providers;

use Illuminate\Support\ServiceProvider;

class HealthCheckServiceProvider extends ServiceProvider
{
    public function loadWhen(): bool
    {
        return true;
    }

    public function register()
    {
        if (!$this->loadWhen()) {
            return ;
        }

        $this->loadRoutesFrom(__DIR__ . '/../route.php');
    }
}
