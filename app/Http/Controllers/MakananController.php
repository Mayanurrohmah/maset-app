<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\MakananModel;
use App\Helpers\AktivitasHelper;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Auth;

class MakananController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        AktivitasHelper::catat('Melihat halaman dashboard rekomendasi makanan');
        return view('makanan.index'); // Assuming you have a view for listing Makanan

    }

    public function kelolaMakanan()
    {
        AktivitasHelper::catat('Melihat halaman kelola makanan');
        // Logic to handle the listing of Makanan
        // return view('makanan.kelola_makanan'); // Assuming you have a view for listing Makanan
        $makanans = MakananModel::latest()->paginate(10);
        return view('makanan.kelola_makanan', compact('makanans'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('makanan.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'nama_makanan' => 'required|string|max:255',
            'harga' => 'required|integer',
        ]);

        MakananModel::create($request->all());

        return redirect()->route('makanan.index')->with('success', 'Makanan berhasil ditambahkan.');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        // AktivitasHelper::catat("Melihat detail makanan: {$makanan->nama}");
        // return view('makanan.detail', ['id' => $id]); // Assuming you have a view for showing Makanan details
        $makanan = MakananModel::findOrFail($id);
        return view('makanan.detail', compact('makanan'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        return view('makanan.edit', compact('makanan'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request,  MakananModel $makanan)
    {
        $request->validate([
            'nama_makanan' => 'required|string|max:255',
            'harga' => 'required|integer',
        ]);

        $makanan->update($request->all());

        return redirect()->route('makanan.index')->with('success', 'Makanan berhasil diperbarui.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(MakananModel $makanan)
    {
        $makanan->delete();

        return redirect()->route('makanan.index')->with('success', 'Makanan berhasil dihapus.');
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
        $favorit = Auth::user()->favoritMakanan()->get();
        return view('makanan.favorit', compact('favorit'));
    }

    public function rekomendasiMakanan()
    {
        AktivitasHelper::catat('Melihat halaman rekomendasi makanan');
        // $makanans = MakananModel::latest()->paginate(10);
        $makanans = MakananModel::all();
        // Logic to handle the listing of recommended Makanan
        return view('makanan.rekomendasi_makanan', compact('makanans')); // Assuming you have a view for listing recommended Makanan
        // return redirect()->route('makanan.rekomendasi_makanan', ['showModal' => 'true']);

    }

    public function getRekomendasi(Request $request)
    {
        // Simpan preferensi ke session atau database...
        AktivitasHelper::catat("Memulai rekomendasi dengan diet: {$request->diet}");

        // return redirect()->route('makanan.rekomendasi_makanan', ['showModal' => 'true']);

        // Validasi input dari pengguna
        $request->validate([
            'budget' => 'required|numeric',
            'diet' => 'required|string',
        ]);

        // Kirim request ke API Flask
        $response = Http::post('http://127.0.0.1:5000/rekomendasi', [
            'budget' => (int) $request->budget,
            'preferensi_diet' => $request->diet,
        ]);

        // Cek jika request berhasil dan kembalikan response JSON
        if ($response->successful()) {
            return response()->json($response->json());
        }

        // Jika gagal, kembalikan pesan error
        return response()->json(['error' => 'Gagal mengambil rekomendasi dari API.'], $response->status());
    }
}
