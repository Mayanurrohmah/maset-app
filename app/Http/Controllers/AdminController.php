<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\AktivitasUser;
use App\Models\User;
use App\Models\Favorit;
use App\Models\MakananModel;
use Carbon\Carbon;

class AdminController extends Controller
{
    /**
     * Tampilkan halaman dashboard admin dengan statistik dan grafik.
     */
    public function dashboard()
    {
        $jumlahUser = User::count();
        $jumlahMakanan = MakananModel::count();
        $jumlahFavorit = Favorit::count();

        // Data untuk chart makanan berdasarkan tipe diet
        $kategoriData = MakananModel::select('tipe_diet', DB::raw('count(*) as total'))
            ->groupBy('tipe_diet')
            ->pluck('total');

        $kategoriLabels = MakananModel::select('tipe_diet', DB::raw('count(*) as total'))
            ->groupBy('tipe_diet')
            ->pluck('tipe_diet');

        return view('admin.dashboard', compact(
            'jumlahUser',
            'jumlahMakanan',
            'jumlahFavorit',
            'kategoriLabels',
            'kategoriData'
        ));
    }

    /**
     * Tampilkan log aktivitas user dan admin dengan filter.
     */
    public function userActivities(Request $request)
    {
        $filterBy = $request->input('filter_by');
        $search = $request->input('search');
        $dateRange = $request->input('date_range');

        // Fungsi reusable untuk membuat query berdasarkan role
        $buildLogQuery = function ($role) use ($filterBy, $search, $dateRange) {
            $query = AktivitasUser::with('user')->whereHas('user', fn($q) => $q->where('role', $role));

            if ($search && $filterBy) {
                if (in_array($filterBy, ['name', 'role'])) {
                    $query->whereHas('user', fn($q) => $q->where($filterBy, 'like', "%$search%"));
                } elseif ($filterBy === 'aksi') {
                    $query->where('aksi', 'like', "%$search%");
                }
            }

            if ($dateRange && str_contains($dateRange, 's.d')) {
                [$start, $end] = explode('s.d', $dateRange);
                $startDate = Carbon::parse(trim($start))->startOfDay();
                $endDate = Carbon::parse(trim($end))->endOfDay();
                $query->whereBetween('created_at', [$startDate, $endDate]);
            }

            return $query;
        };

        $adminLogs = $buildLogQuery('admin')->latest()->paginate(10, ['*'], 'adminPage');
        $userLogs = $buildLogQuery('user')->latest()->paginate(10, ['*'], 'userPage');

        return view('auth.user_activity', compact('adminLogs', 'userLogs'));
    }

    /**
     * Tampilkan data semua pengguna non-admin.
     */
    public function dataPengguna()
    {
        $users = User::where('role', '!=', 'admin')->get();
        return view('auth.datapengguna', compact('users'));
    }

    /**
     * Tampilkan form edit pengguna.
     */
    public function editPengguna($id)
    {
        $user = User::findOrFail($id);
        return view('auth.editpengguna', compact('user'));
    }

    /**
     * Update data pengguna.
     */
    public function updatePengguna(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255|unique:users,email,' . $id,
            'role' => 'required|in:user,admin',
        ]);

        $user = User::findOrFail($id);
        $user->update($request->only(['name', 'email', 'role']));

        return redirect()->route('auth.user_pengguna')->with('success', 'Pengguna berhasil diperbarui.');
    }

    /**
     * Hapus pengguna berdasarkan ID.
     */
    public function hapusPengguna($id)
    {
        $user = User::findOrFail($id);
        $user->delete();

        return redirect()->route('auth.user_pengguna')->with('success', 'Pengguna berhasil dihapus.');
    }

    /**
     * Ubah role pengguna.
     */
    // public function ubahRole(Request $request, $id)
    // {
    //     $request->validate([
    //         'role' => 'required|in:user,admin',
    //     ]);

    //     $user = User::findOrFail($id);
    //     $user->role = $request->input('role');
    //     $user->save();

    //     return redirect()->back()->with('success', 'Role pengguna berhasil diubah.');
    // }
}
