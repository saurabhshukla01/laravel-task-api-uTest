<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\API\BaseController;
use App\Models\Task;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Helpers\StatusCode;
use Exception;

class TaskController extends BaseController
{
    public function index(Request $request)
    {
        try {
            $query = Task::where('user_id', auth()->id());

            if ($request->filled('status')) {
                $query->where('status', $request->status);
            }

            if ($request->filled('due_date')) {
                $query->whereDate('due_date', $request->due_date);
            }

            if ($request->filled('title')) {
                $query->where('title', 'like', '%' . $request->title . '%');
            }

            $orderBy = $request->get('order_by', 'due_date');
            $direction = $request->get('direction', 'asc');
            $perPage = $request->query('per_page', 5);

            $tasks = $query->orderBy($orderBy, $direction)->paginate($perPage);

            return $this->sendResponse($tasks, __('messages.task_fetched'), StatusCode::OK);
        } catch (Exception $e) {
            return $this->sendError(__('messages.general_error'), [], StatusCode::SERVER_ERROR);
        }
    }

    public function store(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'title' => 'required|string',
                'description' => 'nullable|string',
                'due_date' => 'required|date|after:today',
                'status' => 'required|in:Pending,In Progress,Completed',
            ]);

            if ($validator->fails()) {
                return $this->sendError(__('messages.validation_error'), $validator->errors(), StatusCode::VALIDATION_ERROR);
            }

            $task = auth()->user()->tasks()->create($request->all());

            return $this->sendResponse($task, __('messages.task_created'), StatusCode::CREATED);
        } catch (Exception $e) {
            return $this->sendError(__('messages.general_error'), [], StatusCode::SERVER_ERROR);
        }
    }

    public function show($id)
    {
        try {
            $task = auth()->user()->tasks()->find($id);

            if (!$task) {
                return $this->sendError(__('messages.not_found'), [], StatusCode::NOT_FOUND);
            }

            return $this->sendResponse($task, 'Task details.', StatusCode::OK);
        } catch (Exception $e) {
            return $this->sendError(__('messages.general_error'), [], StatusCode::SERVER_ERROR);
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $task = auth()->user()->tasks()->find($id);

            if (!$task) {
                return $this->sendError(__('messages.not_found'), [], StatusCode::NOT_FOUND);
            }

            $validator = Validator::make($request->all(), [
                'title' => 'required|string',
                'description' => 'nullable|string',
                'due_date' => 'required|date|after:today',
                'status' => 'required|in:Pending,In Progress,Completed',
            ]);

            if ($validator->fails()) {
                return $this->sendError(__('messages.validation_error'), $validator->errors(), StatusCode::VALIDATION_ERROR);
            }

            $task->update($request->all());

            return $this->sendResponse($task, __('messages.task_updated'), StatusCode::OK);
        } catch (Exception $e) {
            return $this->sendError(__('messages.general_error'), [], StatusCode::SERVER_ERROR);
        }
    }

    public function destroy($id)
    {
        try {
            $task = auth()->user()->tasks()->find($id);

            if (!$task) {
                return $this->sendError(__('messages.not_found'), [], StatusCode::NOT_FOUND);
            }

            $task->delete();

            return $this->sendResponse([], __('messages.task_deleted'), StatusCode::OK);
        } catch (Exception $e) {
            return $this->sendError(__('messages.general_error'), [], StatusCode::SERVER_ERROR);
        }
    }
}
