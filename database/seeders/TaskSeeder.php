<?php

namespace Database\Seeders;

use App\Models\Task;
use App\Models\User;
use Illuminate\Database\Seeder;

class TaskSeeder extends Seeder
{
    public function run(): void
    {
        // Assign 20+ tasks across the 3 users
        $users = User::all();

        foreach ($users as $user) {
            Task::factory()
                ->count(7) // 7 * 3 users = 21 tasks
                ->for($user)
                ->create();
        }
    }
}
