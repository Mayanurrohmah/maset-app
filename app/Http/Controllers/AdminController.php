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
        // --- 1. Data untuk Kartu Statistik Utama ---
        $jumlahUser = User::count();
        $jumlahMakanan = MakananModel::count();

        // Cari makanan paling favorit berdasarkan jumlah favoritnya
        $palingFavorit = MakananModel::withCount('favorits')
            ->orderBy('favorits_count', 'desc')
            ->first();

        // Hitung pengguna aktif hari ini (gunakan last_login_at jika ada, fallback ke created_at)
        $penggunaAktif = User::whereDate('created_at', Carbon::today())->count();

        // --- 2. Data untuk Tabel ---
        $penggunaTerbaru = User::latest()->take(5)->get();

        // --- 3. Data untuk Grafik ---

        // Grafik Pendaftaran Pengguna Baru (7 Hari Terakhir)
        $userLabels = [];
        $userData = [];
        for ($i = 6; $i >= 0; $i--) {
            $tanggal = Carbon::today()->subDays($i);
            $userLabels[] = $tanggal->format('d M');
            $userData[] = User::whereDate('created_at', $tanggal)->count();
        }

        // Grafik Distribusi Tipe Diet
        $dietStats = MakananModel::select('tipe_diet', DB::raw('count(*) as total'))
            ->groupBy('tipe_diet')
            ->get();
        $dietLabels = $dietStats->pluck('tipe_diet')->toArray();
        $dietData = $dietStats->pluck('total')->map(fn($v) => (int)$v)->toArray();

        // Ambil distribusi tipe data
        // $results = DB::table('makanan')
        //     ->select('tipe_diet', DB::raw('COUNT(*) as count'))
        //     ->groupBy('tipe_diet')
        //     ->get();

        // // Siapkan data untuk Chart.js
        // $labels = $results->pluck('tipe_diet');
        // $data = $results->pluck('count');

        // Grafik 5 Makanan Terfavorit
        $topFoods = MakananModel::withCount('favorits')
            ->orderBy('favorits_count', 'desc')
            ->take(5)
            ->get();
        $topFoodsLabels = $topFoods->pluck('nama_makanan')->toArray();
        $topFoodsData = $topFoods->pluck('favorits_count')->map(fn($v) => (int)$v)->toArray();


        // Mengirim semua data ke view
        return view('admin.dashboard', compact(
            'jumlahUser',
            'jumlahMakanan',
            'palingFavorit',
            'penggunaAktif',
            'penggunaTerbaru',
            'userLabels',
            'userData',
            'dietLabels',
            'dietData',
            'topFoodsLabels',
            'topFoodsData',
            // 'labels', 
            // 'data'
        ));
    }

    // public function chartData(Request $request)
    // {
    //     $type = $request->query('type');

    //     switch ($type) {
    //         case 'user':
    //             $tanggal7Hari = collect(range(0, 6))->map(function ($daysAgo) {
    //                 return \Carbon\Carbon::today()->subDays($daysAgo)->format('Y-m-d');
    //             })->reverse();

    //             $userLabels = $tanggal7Hari->map(function ($tanggal) {
    //                 return \Carbon\Carbon::parse($tanggal)->format('d M');
    //             });

    //             $userData = $tanggal7Hari->map(function ($tanggal) {
    //                 return \App\Models\User::whereDate('created_at', $tanggal)->count();
    //             });

    //             return response()->json([
    //                 'labels' => $userLabels,
    //                 'data' => $userData
    //             ]);

    //         case 'diet':
    //             $dietCounts = \App\Models\MakananModel::select('tipe_diet')
    //                 ->whereNotNull('tipe_diet')
    //                 ->groupBy('tipe_diet')
    //                 ->selectRaw('tipe_diet, COUNT(*) as jumlah')
    //                 ->get();

    //             return response()->json([
    //                 'labels' => $dietCounts->pluck('tipe_diet'),
    //                 'data' => $dietCounts->pluck('jumlah'),
    //             ]);

    //         case 'top_foods':
    //             $topFoods = \App\Models\MakananModel::orderByDesc('favorit')->take(5)->get();

    //             return response()->json([
    //                 'labels' => $topFoods->pluck('nama_makanan'),
    //                 'data' => $topFoods->pluck('favorit'),
    //             ]);

    //         default:
    //             return response()->json(['error' => 'Invalid type'], 400);
    //     }
    // }

    public function chartData(Request $request)
    {
        $type = $request->query('type');

        switch ($type) {
            case 'user':
                $tanggal7Hari = collect(range(0, 6))->map(function ($daysAgo) {
                    return Carbon::today()->subDays($daysAgo)->format('Y-m-d');
                })->reverse();

                $userLabels = $tanggal7Hari->map(fn($tanggal) => Carbon::parse($tanggal)->format('d M'))->toArray();
                $userData = $tanggal7Hari->map(fn($tanggal) => (int) User::whereDate('created_at', $tanggal)->count())->toArray();

                return response()->json([
                    'labels' => $userLabels,
                    'data' => $userData
                ]);

            case 'diet':
                $dietCounts = MakananModel::whereNotNull('tipe_diet')
                    ->select('tipe_diet', DB::raw('COUNT(*) as jumlah'))
                    ->groupBy('tipe_diet')
                    ->get();

                // dd($dietCounts);

                return response()->json([
                    'labels' => $dietCounts->pluck('tipe_diet'),
                    'data' => $dietCounts->pluck('jumlah')->map(fn($x) => (int) $x),
                ]);

            case 'top_foods':
                $topFoods = MakananModel::withCount('favorits')
                    ->orderByDesc('favorits_count')
                    ->take(5)
                    ->get();

                return response()->json([
                    'labels' => $topFoods->pluck('nama_makanan')->toArray(),
                    'data' => $topFoods->pluck('favorits_count')->map(fn($x) => (int) $x)->toArray(),
                ]);

            default:
                return response()->json(['error' => 'Invalid type'], 400);
        }
    }

    public function getData()
    {
        $data = DB::table('makanan')
            ->select('tipe_diet', DB::raw('COUNT(*) as jumlah'))
            ->groupBy('tipe_diet')
            ->get();

        return response()->json($data);
    }
    /**
     * Tampilkan log aktivitas user dan admin dengan filter.
     */
    public function userActivities($id)
    {
        // $filterBy = $request->input('filter_by');
        // $search = $request->input('search');
        // $dateRange = $request->input('date_range');

        // // Fungsi reusable untuk membuat query berdasarkan role
        // $buildLogQuery = function ($role) use ($filterBy, $search, $dateRange) {
        //     $query = AktivitasUser::with('user')->whereHas('user', fn($q) => $q->where('role', $role));

        //     if ($search && $filterBy) {
        //         if (in_array($filterBy, ['name', 'role'])) {
        //             $query->whereHas('user', fn($q) => $q->where($filterBy, 'like', "%$search%"));
        //         } elseif ($filterBy === 'aksi') {
        //             $query->where('aksi', 'like', "%$search%");
        //         }
        //     }

        //     if ($dateRange && str_contains($dateRange, 's.d')) {
        //         [$start, $end] = explode('s.d', $dateRange);
        //         $startDate = Carbon::parse(trim($start))->startOfDay();
        //         $endDate = Carbon::parse(trim($end))->endOfDay();
        //         $query->whereBetween('created_at', [$startDate, $endDate]);
        //     }

        //     return $query;
        // };

        // $adminLogs = $buildLogQuery('admin')->latest()->paginate(10, ['*'], 'adminPage');
        // $userLogs = $buildLogQuery('user')->latest()->paginate(10, ['*'], 'userPage');

        // return view('auth.user_activity', compact('adminLogs', 'userLogs'));

        $user = User::findOrFail($id);
        // $aktivitas = AktivitasUser::where('user_id', $id)->latest()->get();
        $aktivitas = AktivitasUser::where('user_id', $id)->latest()->paginate(10);


        return view('admin.aktivitas_user', compact('user', 'aktivitas'));
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
    public function ubahRole(Request $request, $id)
    {
        $request->validate([
            'role' => 'required|in:user,admin',
        ]);

        $user = User::findOrFail($id);
        $user->role = $request->input('role');
        $user->save();

        return redirect()->back()->with('success', 'Role pengguna berhasil diubah.');
    }
}
