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

// Default home (bisa digunakan oleh user biasa)
// Route::get('/', function () {
//     return view('dashboard');
// })->middleware(['auth', 'verified'])->name('dashboard');

route::get('/', [LandingController::class, 'index'])->name('landing.index');

// Admin dashboard (khusus admin)
Route::middleware(['auth', 'admin'])->group(function () {
    Route::get('/dashboardAdmin', [AdminController::class, 'dashboard'])->name('admin.dashboard');
    Route::get('/kelolaMakanan', [MakananController::class, 'kelolaMakanan'])->name('makanan.kelola_makanan');
    Route::get('/addMakanan', [MakananController::class, 'create'])->name('makanan.create');
    Route::post('/addMakanan', [MakananController::class, 'store'])->name('makanan.store');
    Route::get('/makanan/{makanan}/edit', [MakananController::class, 'edit'])->name('makanan.edit');
    Route::put('/makanan/{makanan}/update', [MakananController::class, 'update'])->name('makanan.update');
    Route::delete('/makanan/{makanan}', [MakananController::class, 'destroy'])->name('makanan.destroy');
    Route::get('/aktivitas', [AdminController::class, 'userActivities'])->name('auth.user_activity');
    Route::get('/makanan/import', [MakananController::class, 'showImportForm'])->name('makanan.import');
    Route::post('/makanan/import', [MakananController::class, 'import'])->name('makanan.import.store');
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
});


// Route::post('/get-rekomendasi', function (Request $request) {
//     $response = Http::post('http://127.0.0.1:5000/rekomendasi', [ // ganti dengan IP server Flask jika hosting
//         'budget' => $request->budget,
//         'preferensi_diet' => $request->diet
//     ]);

//     return $response->json();
// })->name('makanan.get_rekomendasi');



Route::middleware(['auth', 'admin'])->group(function () {
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
    Route::delete('/makanan/{id}', [MakananController::class, 'destroy'])->name('makanan.destroy');

});

Route::middleware(['auth', 'admin'])->group(function () {
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
