<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\MakananController;
use App\Http\Controllers\LandingController;
use Illuminate\Session\Middleware\AuthenticateSession;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
*/



route::get('/', [LandingController::class, 'index'])->name('landing.index');
// Route::post('/logout', [AuthenticateSession::class, 'destroy'])->name('logout');

// Admin dashboard (khusus admin)
Route::middleware(['auth', 'admin'])->group(function () {
    Route::get('/dashboardAdmin', [AdminController::class, 'dashboard'])->name('admin.dashboard');
    Route::get('/kelolaMakanan', [MakananController::class, 'kelolaMakanan'])->name('makanan.kelola_makanan');
    Route::get('/tambahMakanan', [MakananController::class, 'create'])->name('makanan.create');
    Route::post('/tambahMakanan', [MakananController::class, 'store'])->name('makanan.store');
    Route::get('/editMakanan/{makanan}/edit', [MakananController::class, 'edit'])->name('makanan.edit');
    Route::put('/editMakanan/{makanan}/update', [MakananController::class, 'update'])->name('makanan.update');
    Route::delete('/makanan/{makanan}', [MakananController::class, 'destroy'])->name('makanan.destroy');
    // Route::get('/aktivitas', [AdminController::class, 'userActivities'])->name('auth.user_activity');
    Route::get('/aktivitas/{id}', [AdminController::class, 'userActivities'])->name('admin.user_activity');
    Route::get('/makanan/import', [MakananController::class, 'showImportForm'])->name('makanan.import');
    Route::post('/makanan/import', [MakananController::class, 'import'])->name('makanan.import.store');

    // Fitur pengguna
    Route::get('/data-pengguna', [AdminController::class, 'dataPengguna'])->name('auth.user_pengguna');
    Route::get('/data-pengguna/{id}/edit', [AdminController::class, 'editPengguna'])->name('auth.user_pengguna.edit');
    Route::put('/data-pengguna/{id}', [AdminController::class, 'updatePengguna'])->name('auth.user_pengguna.update');
    Route::delete('/data-pengguna/{id}', [AdminController::class, 'hapusPengguna'])->name('auth.user_pengguna.hapus');
    Route::post('/data-pengguna/{id}/ubah-role', [AdminController::class, 'ubahRole'])->name('auth.user_pengguna.role');
});


Route::middleware(['auth', 'verified'])->group(function () {
    // Rute untuk menampilkan halaman rekomendasi makanan
    Route::get('/dashboard', [MakananController::class, 'index'])->name('makanan.dashboard');
    Route::get('/rekomendasiMakanan', [MakananController::class, 'rekomendasiMakanan'])->name('makanan.rekomendasi_makanan');
    // Rute untuk menangani request AJAX ke API Flask
    Route::post('/rekomendasiMakanan', [MakananController::class, 'getRekomendasi'])->name('makanan.get_rekomendasi');
    Route::get('/makanan/{id}', [MakananController::class, 'show'])->name('makanan.show');
    Route::get('/detailMakanan', [MakananController::class, 'show'])->name('makanan.detail_makanan');

    Route::post('/favorit/{makanan_id}', [MakananController::class, 'toggleFavorit'])->name('favorit.toggle');
    Route::get('/favorit', [MakananController::class, 'favorit'])->name('makanan.favorit');
});

// Profile routes
Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
    Route::delete('/profile/photo', [ProfileController::class, 'deletePhoto'])->name('profile.photo.delete');
});


require __DIR__ . '/auth.php';
