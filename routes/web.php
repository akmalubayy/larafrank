<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/debug-server', function (Request $request) {
    return response()->json([
        'server_software' => $_SERVER['SERVER_SOFTWARE'] ?? 'not set',
        'server_name' => $_SERVER['SERVER_NAME'] ?? 'not set',
        'server_port' => $_SERVER['SERVER_PORT'] ?? 'not set',
        'php_version' => PHP_VERSION,
        'php_sapi' => PHP_SAPI,
        'laravel_version' => app()->version(),
    ]);
});
