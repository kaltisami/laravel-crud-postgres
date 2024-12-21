<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TaskController;

Route::get('/', function () {
    return view('welcome');
});


Route::middleware('api')->group(function () {
    Route::resource('tasks', TaskController::class);
});

