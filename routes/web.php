<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\DiscoverController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\MakananController;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth; // ✅ Tambahkan ini untuk Auth


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
*/

// Default home (bisa digunakan oleh user biasa)
Route::get('/', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

// Admin dashboard (khusus admin)
Route::middleware(['auth', 'admin'])->group(function () {
    Route::get('/admin/dashboard', [AdminController::class, 'dashboard'])->name('admin.dashboard');
});

Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('/dashboard', [MakananController::class, 'index'])->name('makanan.dashboard');
});
Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('/rekomendasiMakanan', [MakananController::class, 'rekomendasiMakanan'])->name('makanan.rekomendasi_makanan');
});
Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('/detailMakanan', [MakananController::class, 'show'])->name('makanan.detail_makanan');
});
Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('/favorit', [MakananController::class, 'favorit'])->name('makanan.favorit');
});
Route::middleware(['auth', 'admin'])->group(function () {
    Route::get('/kelolaMakanan', [MakananController::class, 'kelolaMakanan'])->name('makanan.kelola_makanan');
});

Route::middleware(['auth', 'admin'])->group(function () {
    Route::get('/aktivitas', [AdminController::class, 'userActivities'])->name('auth.user_activity');
});

// Redirect setelah login berdasarkan role
Route::get('/redirect', function () {
    $user = Auth::user();

    if ($user->role === 'admin') {
        return redirect()->route('admin.dashboard');
    }

    return redirect()->route('dashboard');
})->middleware(['auth'])->name('redirect');

// Profile routes
Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

// Discover and Diet Selection (hanya untuk user biasa misalnya)
Route::middleware('auth')->group(function () {
    Route::get('/diet', fn() => view('diet-selection'))->name('diet');
    Route::get('/discover', [DiscoverController::class, 'index'])->name('discover');
});

// Default auth routes
require __DIR__.'/auth.php';