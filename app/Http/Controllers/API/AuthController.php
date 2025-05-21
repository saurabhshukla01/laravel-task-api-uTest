<?php

namespace App\Http\Controllers\API;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Exception;

class AuthController extends BaseController
{
    public function register(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'name' => 'required|string|max:255',
                'email' => 'required|string|email|unique:users',
                'password' => 'required|string|min:6'
            ]);

            if ($validator->fails()) {
                return $this->sendError(__('messages.validation_error'), $validator->errors(), 422);
            }

            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => Hash::make($request->password)
            ]);

            $token = $user->createToken('auth_token')->plainTextToken;

            return $this->sendResponse(['token' => $token], __('messages.register_success'), 201);
        } catch (Exception $e) {
            return $this->sendError(__('messages.general_error'), [], 500);
        }
    }

    public function login(Request $request)
    {
        try {
            $credentials = $request->only('email', 'password');

            $user = User::where('email', $credentials['email'])->first();

            if (!$user || !Hash::check($credentials['password'], $user->password)) {
                return $this->sendError(__('messages.invalid_credentials'), [], 401);
            }

            $token = $user->createToken('auth_token')->plainTextToken;

            return $this->sendResponse(['token' => $token], __('messages.login_success'));
        } catch (Exception $e) {
            return $this->sendError(__('messages.general_error'), [], 500);
        }
    }
}
