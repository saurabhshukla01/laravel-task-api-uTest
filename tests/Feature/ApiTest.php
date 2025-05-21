<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use App\Models\User;
use App\Models\Task;

class ApiTest extends TestCase
{
    use RefreshDatabase;

    public function test_user_can_register()
    {
        $response = $this->postJson('/api/register', [
            'name' => 'Test User',
            'email' => 'test@example.com',
            'password' => 'password',
        ]);

        $response->assertStatus(201)->assertJsonStructure(['success', 'data', 'message']);
    }

    public function test_user_can_login()
    {
        $user = User::factory()->create([
            'email' => 'test@example.com',
            'password' => bcrypt('password'),
        ]);

        $response = $this->postJson('/api/login', [
            'email' => 'test@example.com',
            'password' => 'password',
        ]);

        $response->assertStatus(200)->assertJsonStructure(['success', 'data', 'message']);
    }

    public function test_user_can_crud_task()
    {
        $user = User::factory()->create();
        $token = $user->createToken('test_token')->plainTextToken;

        // Create task
        $create = $this->withToken($token)->postJson('/api/tasks', [
            'title' => 'Test Task',
            'description' => 'Details',
            'due_date' => now()->addDays(2)->format('Y-m-d'),
            'status' => 'Pending'
        ]);
        $create->assertStatus(201);
        $taskId = $create['data']['id'];

        // Read task
        $this->withToken($token)->getJson("/api/tasks/{$taskId}")->assertStatus(200);

        // Update task
        $this->withToken($token)->putJson("/api/tasks/{$taskId}", [
            'title' => 'Updated Task',
            'description' => 'Updated desc',
            'due_date' => now()->addDays(5)->format('Y-m-d'),
            'status' => 'In Progress'
        ])->assertStatus(200);

        // Delete task
        $this->withToken($token)->deleteJson("/api/tasks/{$taskId}")->assertStatus(200);
    }
}