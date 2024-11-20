<?php

namespace Database\Seeders;

use App\Models\Metric;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class MetricSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Metric::factory()->count(1000)->create();   
    }
}
