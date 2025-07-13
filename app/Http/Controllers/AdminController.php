<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\AktivitasUser;
use App\Models\User;
use App\Models\MakananModel;

class AdminController extends Controller
{
    /**
     * Tampilkan halaman dashboard admin dengan ringkasan data.
     */
    public function dashboard()
    {
        // Total pengguna dan makanan
        $jumlahUser = User::count();
        $jumlahMakanan = MakananModel::count();

        // Statistik makanan per tipe diet
        $kategoriStats = MakananModel::selectRaw('tipe_diet, COUNT(*) as total')
            ->groupBy('tipe_diet')
            ->pluck('total', 'tipe_diet');

        $kategoriLabels = $kategoriStats->keys();
        $kategoriData = $kategoriStats->values();

        // Kirim data ke view
        return view('admin.dashboard', [
            'jumlahUser' => $jumlahUser,
            'jumlahMakanan' => $jumlahMakanan,
            'kategoriLabels' => $kategoriLabels,
            'kategoriData' => $kategoriData,
        ]);
    }

    /**
     * Tampilkan halaman aktivitas pengguna (log aktivitas).
     */
    public function userActivities()
    {
        $log = AktivitasUser::with('user')->latest()->get();
        return view('auth.user_activity', compact('log'));
    }
}
