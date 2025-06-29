<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\DiscoverController;
use App\Http\Controllers\AdminController;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth; // ✅ Tambahkan ini untuk Auth

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
*/

// Route redirect setelah login: user → dashboard, admin → admin dashboard
Route::get('/redirect', function () {
    $user = Auth::user();

    if ($user->role === 'admin') {
        return redirect()->route('admin.dashboard');
    }

    return redirect()->route('dashboard');
})->middleware(['auth']);

// Dashboard user biasa
Route::get('/', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

// Admin dashboard
Route::middleware(['auth', 'admin'])->group(function () {
    Route::get('/admin/dashboard', [AdminController::class, 'dashboard'])->name('admin.dashboard');
});

// Profile routes
Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

// Diet selection
Route::get('/diet', function () {
    return view('diet-selection');
});

// Discover
Route::get('/discover', [DiscoverController::class, 'index'])->name('discover');

// Auth routes
require __DIR__.'/auth.php';
