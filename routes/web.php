<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\MakananController;
use App\Http\Controllers\LandingController;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
*/

Route::get('/', [LandingController::class, 'index'])->name('landing');

// Redirect setelah login berdasarkan role
Route::get('/redirect', function () {
    $user = Auth::user();

    if ($user->role === 'admin') {
        return redirect()->route('admin.dashboard');
    }

    return redirect()->route('makanan.dashboard');
})->middleware(['auth'])->name('redirect');

// Import CSV khusus admin (kalau diperlukan)
Route::get('/import-makanan', [MakananController::class, 'import'])->name('makanan.import');

/*
|--------------------------------------------------------------------------
| User Biasa
|--------------------------------------------------------------------------
*/
Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('/dashboard', [MakananController::class, 'index'])->name('makanan.dashboard');

    Route::get('/rekomendasiMakanan', [MakananController::class, 'rekomendasiMakanan'])->name('makanan.rekomendasi_makanan');
    Route::post('/rekomendasiMakanan', [MakananController::class, 'getRekomendasi'])->name('makanan.get_rekomendasi');

    Route::get('/makanan/{id}', [MakananController::class, 'show'])->name('makanan.show');
    Route::post('/favorit/{makanan_id}', [MakananController::class, 'toggleFavorit'])->name('favorit.toggle');
    Route::get('/favorit', [MakananController::class, 'favorit'])->name('makanan.favorit');
});

/*
|--------------------------------------------------------------------------
| Admin
|--------------------------------------------------------------------------
*/
Route::middleware(['auth', 'admin'])->group(function () {
    Route::get('/admin/dashboard', [AdminController::class, 'dashboard'])->name('admin.dashboard');

    // Fitur makanan
    Route::get('/kelolaMakanan', [MakananController::class, 'kelolaMakanan'])->name('makanan.kelola_makanan');
    Route::resource('makanan', MakananController::class);
    Route::post('/favorit/{makanan_id}', [MakananController::class, 'toggleFavorit'])->name('favorit.toggle');
    Route::get('/favorit', [MakananController::class, 'favorit'])->name('makanan.favorit');

    // Fitur pengguna
    Route::get('/data-pengguna', [AdminController::class, 'dataPengguna'])->name('auth.user_pengguna');
    Route::get('/data-pengguna/{id}/edit', [AdminController::class, 'editPengguna'])->name('auth.user_pengguna.edit');
    Route::put('/data-pengguna/{id}', [AdminController::class, 'updatePengguna'])->name('auth.user_pengguna.update');
    Route::delete('/data-pengguna/{id}', [AdminController::class, 'hapusPengguna'])->name('auth.user_pengguna.hapus');
    Route::post('/data-pengguna/{id}/ubah-role', [AdminController::class, 'ubahRole'])->name('auth.user_pengguna.role');

    // Aktivitas
    Route::get('/aktivitas', [AdminController::class, 'userActivities'])->name('auth.user_activity');
});

/*
|--------------------------------------------------------------------------
| Profile
|--------------------------------------------------------------------------
*/
Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile/photo', [ProfileController::class, 'deletePhoto'])->name('profile.photo.delete');
});

require __DIR__ . '/auth.php';
