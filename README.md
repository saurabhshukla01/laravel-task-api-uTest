# Laravel 12.x Task Management API

## 📘 Project Overview

This is a Task Management RESTful API built with Laravel 12.x. It features token-based authentication using Laravel Sanctum, CRUD operations on tasks, task filtering/sorting, validation, and proper error handling.

---

## ⚙️ Setup Instructions

### 1. Clone the Repository

```bash
git clone <your-repo-url>
cd task-api
```

### 2. Install Dependencies

```bash
composer install
```

### 3. Copy and Configure `.env` File

```bash
cp .env.example .env
```

Edit `.env` and set your DB config:

```env
DB_DATABASE=your_database
DB_USERNAME=your_username
DB_PASSWORD=your_password
```

### 5. Install api & Sanctum 

```bash
php artisan install:api 
```

---

###  6. When add helper file then need to run this command 
```bash
composer dump-autoload
```

---

## 📦 Database & Seeder Setup

### 1. Run Migrations & Seeders

```bash
php artisan migrate:fresh --seed
```

This will:

* Create all tables
* Seed 3 users and 20+ tasks (randomly distributed)

### 2. User Credentials for Testing

Each user has email/password generated via factory. You can update one in `UserSeeder` to a known email for manual testing.

---

## 🔐 Authentication

### 1. Register a User

**POST** `/api/register`

```json
{
  "name": "John Doe",
  "email": "john@example.com",
  "password": "password"
}
```

**Returns:** Token on success

### 2. Login

**POST** `/api/login`

```json
{
  "email": "john@example.com",
  "password": "password"
}
```

**Returns:** Token on success

### 3. Use Token in All Task Requests

Add the following header:

```http
Authorization: Bearer YOUR_TOKEN
```

---

## ✅ Task API Endpoints

### Create Task

**POST** `/api/tasks`

```json
{
  "title": "New Task",
  "description": "Optional notes",
  "due_date": "2025-07-15",
  "status": "Pending"
}
```

### List Tasks (with optional filters)

**GET** `/api/tasks`

* Query Params:

  * `status`=Pending
  * `due_date`=YYYY-MM-DD
  * `title`=keyword
  * `order_by`=due\_date|created\_at
  * `direction`=asc|desc
  * `page`=2
  * `per_page`=5

### Get Task by ID

**GET** `/api/tasks/{id}`

### Update Task

**PUT** `/api/tasks/{id}`

### Delete Task

**DELETE** `/api/tasks/{id}`

---

## 🧪 Testing with Postman

1. Register/Login to get a token.
2. Set `Authorization: Bearer YOUR_TOKEN` header.
3. Use endpoints to test:

   * Create task
   * List tasks with filters
   * Update/Delete tasks

---

## 🌐 Language Support

Custom API messages are located in `resources/lang/en/messages.php`.

---

## 📂 Factory & Seeder Summary

* `UserFactory` & `TaskFactory` create demo users and tasks
* `UserSeeder` creates 3 users
* `TaskSeeder` assigns 7 tasks to each user (total 21)

---

## 🧰 Tools Used

* Laravel 12.x
* Sanctum for API authentication
* Eloquent for DB ORM
* Postman / Curl for API testing

---

## 📄 License

This project is open-source and free to use.


---

### 🧰 Unit TestCase

🧪 Testing the API

1. Postman Collection

Import the included Postman collection file (Task APIs.postman_collection.json) into Postman.

Test registration, login, and all task endpoints with real token.

Run tests:


```bash
php artisan test
```


### Output :

   PASS  Tests\Unit\ExampleTest
  ✓ that true is true

   PASS  Tests\Feature\ApiTest
  ✓ user can register                                                                                                                                0.24s
  ✓ user can login                                                                                                                                   0.03s
  ✓ user can crud task                                                                                                                               0.02s

   PASS  Tests\Feature\ExampleTest
  ✓ the application returns a successful response                                                                                                    0.02s

  Tests:    5 passed (14 assertions)
  Duration: 0.46s





