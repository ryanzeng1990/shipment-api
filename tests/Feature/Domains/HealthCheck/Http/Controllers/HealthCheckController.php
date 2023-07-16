<?php

namespace Tests\Feature\Domains\HealthCheck\Http\Controllers;

use Tests\TestCase;

class HealthCheckController extends TestCase
{
    public function testHealthCheck(): void
    {
        $this->get('/api/health')->assertOk();
    }
}
