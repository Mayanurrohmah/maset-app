<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\MakananModel;
use App\Helpers\AktivitasHelper;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Auth;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\MakananImport;
use Illuminate\Support\Facades\Log;
use App\Models\Favorit;

class MakananController extends Controller
{

    /**
     * Method helper untuk memanggil API ML dan mendapatkan prediksi cluster.
     * @param array $data Data makanan yang akan diprediksi
     * @return int Nomor cluster yang diprediksi
     */
    private function getClusterFromAPI(array $data): int
    {
        // Endpoint untuk memprediksi cluster MAKANAN
        $apiUrl = 'http://127.0.0.1:5000/predict-food-cluster';

        // Tentukan 'level_harga' berdasarkan 'harga', karena API membutuhkannya
        // $harga = (int)($data['harga'] ?? 0);
        // if ($harga < 18000) {
        //     $level_harga = 'Normal';
        // } elseif ($harga <= 35000) {
        //     $level_harga = 'Mahal';
        // } else {
        //     $level_harga = 'Premium';
        // }

        try {
            $response = Http::timeout(10)->post($apiUrl, [
                'kalori'      => (float)($data['kalori'] ?? 0),
                'protein'     => (float)($data['protein'] ?? 0),
                'karbohidrat' => (float)($data['karbohidrat'] ?? 0),
                'harga'       => (int)($data['harga'] ?? 0),
                'tipe_diet'   => $data['tipe_diet'] ?? 'Normal',
                'level_harga' => $data['level_harga'], // Kirim level_harga ke API
            ]);

            if ($response->successful() && isset($response->json()['cluster'])) {
                return $response->json()['cluster'];
            }
        } catch (\Exception $e) {
            Log::error('Gagal menghubungi API Machine Learning: ' . $e->getMessage());
            return 0; // Cluster default jika gagal
        }
        return 0; // Cluster default jika respons tidak berhasil
    }

    public function index(Request $request)
    {
        // Catat aktivitas pengguna
        AktivitasHelper::catat('Mengakses halaman dashboard makanan');

        return view('makanan.index');
    }


    public function kelolaMakanan(Request $request)
    {
        AktivitasHelper::catat('Melihat halaman kelola makanan');
        // Mulai query builder
        $query = MakananModel::query();

        // Terapkan filter pencarian jika ada
        $query->when($request->input('search'), function ($q, $search) {
            return $q->where('nama_makanan', 'like', "%{$search}%");
        });

        // Terapkan filter tipe diet jika ada
        $query->when($request->input('tipe_diet'), function ($q, $tipe_diet) {
            return $q->where('tipe_diet', $tipe_diet);
        });

        // Ambil data dengan paginasi
        $makanans = $query->latest()->paginate(10);

        return view('makanan.kelola_makanan', compact('makanans'));
    }

    public function create()
    {
        return view('makanan.kelola_makanan.create');
    }

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'nama_makanan' => 'required|string|max:255|unique:makanan,nama_makanan',
            'gambar' => 'nullable|url',
            'kalori' => 'required|numeric',
            'karbohidrat' => 'required|numeric',
            'protein' => 'required|numeric',
            'harga' => 'required|numeric',
            'tipe_diet' => 'required|string',
        ]);

        // Buat objek makanan tapi JANGAN simpan dulu
        $makanan = new MakananModel($validatedData);

        // Saat $makanan->save() dijalankan, event 'saving' pada model akan mengisi 'level_harga'
        $makanan->save();

        // Sekarang $makanan sudah punya 'level_harga', kita bisa panggil API
        $cluster = $this->getClusterFromAPI($makanan->toArray());

        // Update kolom cluster saja
        $makanan->cluster = $cluster;
        $makanan->save();

        return redirect()->route('makanan.kelola_makanan')->with('success', 'Data makanan berhasil ditambahkan dengan cluster ' . $cluster);
    }

    public function show(string $id)
    {
        $makanan = MakananModel::findOrFail($id);
        return view('makanan.detail', compact('makanan'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(MakananModel $makanan)
    {

        AktivitasHelper::catat("Mengedit data makanan: {$makanan->nama_makanan}");
        return view('makanan.kelola_makanan.edit', compact('makanan'));
    }

    public function update(Request $request, string $id)
    {
        // 1. Validasi data yang masuk, pastikan nama makanan unik kecuali untuk dirinya sendiri
        $validatedData = $request->validate([
            'nama_makanan' => 'required|string|max:255|unique:makanan,nama_makanan,' . $id,
            'gambar'       => 'nullable|url',
            'kalori'       => 'required|numeric',
            'karbohidrat'  => 'required|numeric',
            'protein'      => 'required|numeric',
            'harga'        => 'required|numeric',
            'tipe_diet'    => 'required|string',
        ]);

        // 2. Cari data yang akan di-update
        $makanan = MakananModel::findOrFail($id);

        // 3. Isi (fill) model dengan data baru.
        //    Ini BELUM menyimpan ke database, hanya di memori.
        $makanan->fill($validatedData);

        // 4. Panggil API untuk mendapatkan cluster.
        //    Event 'saving' akan otomatis mengisi level_harga saat di-fill,
        //    sehingga kita bisa langsung kirim $makanan->toArray().
        $cluster = $this->getClusterFromAPI($makanan->toArray());

        // 5. Set nilai cluster ke model.
        $makanan->cluster = $cluster;

        // 6. Simpan SEMUA perubahan (data, level_harga, cluster) sekaligus.
        //    Hanya satu kali panggilan save().
        $makanan->save();

        return redirect()->route('makanan.kelola_makanan')->with('success', 'Data makanan berhasil diperbarui.');
    }

    public function destroy(string $id)
    {
        $makanan = MakananModel::findOrFail($id);
        $makanan->delete();

        return redirect()->route('makanan.kelola_makanan')->with('success', 'Makanan berhasil dihapus.');
    }

    public function toggleFavorit($makanan_id)
    {
        $user = Auth::user();
        $favorit = $user->favoritMakanan();

        if ($favorit->where('makanan_id', $makanan_id)->exists()) {
            $favorit->detach($makanan_id);
            return back()->with('success', 'Makanan dihapus dari favorit.');
        } else {
            $favorit->attach($makanan_id);
            return back()->with('success', 'Makanan ditambahkan ke favorit.');
        }
    }

    public function favorit()
    {
        AktivitasHelper::catat('Melihat halaman favorit makanan');
        // $favorit = Auth::user()->favoritMakanan()->get();
        if (Auth::user()->role === 'admin') {
            // Admin melihat semua data favorit dari semua user
            $favorit = Favorit::with(['makanan', 'user'])->get();
        } else {
            // User biasa hanya melihat favorit miliknya
            $favorit = Favorit::with('makanan')
                ->where('user_id', Auth::id())
                ->get();
        }
        return view('makanan.favorit', compact('favorit'));
    }

    public function rekomendasiMakanan(Request $request)
    {
        AktivitasHelper::catat('Melihat halaman rekomendasi makanan');

        // Bangun query awal
        // $query = MakananModel::query();
        // Gunakan withCount untuk menghitung jumlah favorit secara efisien
        $query = MakananModel::withCount('favorits');
        // Filter berdasarkan nama makanan jika ada query
        if ($request->filled('q')) {
            $query->where('nama_makanan', 'like', '%' . $request->q . '%');
        }

        // Eksekusi query dengan pagination
        $makanans = $query->paginate(10)->withQueryString();

        // Jika user login, tambahkan status favorit untuk setiap makanan
        if (Auth::check()) {
            $favoritedIds = Auth::user()->favoritMakanan()->pluck('makanan.id')->toArray();
            $makanans->getCollection()->transform(function ($makanan) use ($favoritedIds) {
                $makanan->is_favorited = in_array($makanan->id, $favoritedIds);
                return $makanan;
            });
        }

        return view('makanan.rekomendasi_makanan', compact('makanans'));
    }


    public function getRekomendasi(Request $request)
    {
        AktivitasHelper::catat("Memulai rekomendasi dengan diet: {$request->diet}");

        $validated = $request->validate([
            'budget' => 'required|numeric',
            'diet'   => 'required|string',
        ]);

        // 1. Panggil API untuk mendapatkan cluster pengguna
        $response = Http::post('http://127.0.0.1:5000/get-user-cluster', [
            'budget'    => (int) $validated['budget'],
            'tipe_diet' => $validated['diet'],
        ]);

        if (!$response->successful()) {
            return response()->json(['error' => 'Gagal mendapatkan cluster rekomendasi dari API.'], 500);
        }

        $cluster = $response->json()['cluster'];
        $budget = (int) $validated['budget'];
        $diet = $validated['diet'];

        // 2. Query database dengan menyertakan data favorit
        $rekomendasi = MakananModel::withCount('favorits') // Hitung jumlah favorit
            ->where('cluster', $cluster)
            ->where('harga', '<=', $budget)
            ->where('tipe_diet', $diet)
            ->inRandomOrder()
            ->limit(10)
            ->get();

        // 3. Tambahkan status favorit untuk user yang sedang login
        if (Auth::check()) {
            $favoritedIds = Auth::user()->favoritMakanan()->pluck('makanan.id')->toArray();
            $rekomendasi->transform(function ($makanan) use ($favoritedIds) {
                $makanan->is_favorited = in_array($makanan->id, $favoritedIds);
                return $makanan;
            });
        }

        // 4. Kembalikan hasilnya sebagai JSON
        return response()->json($rekomendasi);
    }

    public function showImportForm()
    {
        return view('makanan.kelola_makanan.import');
    }

    public function import(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:xlsx,xls,csv,txt'
        ]);

        try {
            $rows = Excel::toCollection(new MakananImport, $request->file('file'))->first();

            if ($rows->isEmpty()) {
                return redirect()->back()->with('error', 'File yang Anda unggah kosong.');
            }

            foreach ($rows as $row) {
                // Fungsi helper untuk membersihkan angka
                $parseNumber = function ($value) {
                    if (is_null($value)) return 0;
                    // Hapus semua karakter kecuali angka, titik, dan koma
                    $clean = preg_replace('/[^\d,\.]/', '', (string)$value);
                    // Ganti koma desimal menjadi titik
                    $clean = str_replace(',', '.', $clean);
                    return (float)$clean;
                };

                $data = [
                    'nama_makanan' => $row['nama_makanan'] ?? null,
                    'gambar'       => $row['gambar'] ?? null,
                    'kalori'       => $parseNumber($row['kalori']),
                    'karbohidrat'  => $parseNumber($row['karbohidrat']),
                    'protein'      => $parseNumber($row['protein']),
                    'harga'        => (int)$parseNumber($row['harga']),
                    'tipe_diet'    => $row['tipe_diet'] ?? 'Normal',
                ];

                if (empty($data['nama_makanan'])) {
                    continue;
                }

                // Tentukan level_harga secara manual sebelum memanggil API
                if ($data['harga'] < 20000) {
                    $data['level_harga'] = 'Normal';
                } elseif ($data['harga'] <= 40000) {
                    $data['level_harga'] = 'Mahal';
                } else {
                    $data['level_harga'] = 'Premium';
                }

                // Panggil API untuk mendapatkan prediksi cluster
                $cluster = $this->getClusterFromAPI($data);
                $data['cluster'] = $cluster;

                // Simpan atau update data ke database
                MakananModel::updateOrCreate(
                    ['nama_makanan' => $data['nama_makanan']],
                    $data
                );
            }

            return redirect()->route('makanan.kelola_makanan')->with('success', 'Data makanan berhasil diimpor!');
        } catch (\Exception $e) {
            Log::error('Import Error: ' . $e->getMessage() . ' on line ' . $e->getLine());
            return redirect()->back()->with('error', 'Terjadi kesalahan saat import. Cek log untuk detail.');
        }
    }
}
