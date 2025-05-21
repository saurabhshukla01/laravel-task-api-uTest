<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class TaskFactory extends Factory
{
    public function definition(): array
    {
        $statuses = ['Pending', 'In Progress', 'Completed'];

        return [
            'title' => fake()->sentence(4),
            'description' => fake()->paragraph(),
            'due_date' => fake()->dateTimeBetween('+1 days', '+1 year')->format('Y-m-d'),
            'status' => fake()->randomElement($statuses),
        ];
    }
}
