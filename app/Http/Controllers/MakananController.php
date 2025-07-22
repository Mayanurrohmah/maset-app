<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\MakananModel;
use App\Helpers\AktivitasHelper;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Auth;

class MakananController extends Controller
{
    public function index()
    {
        AktivitasHelper::catat('Melihat halaman dashboard rekomendasi makanan');
        return view('makanan.index');
    }

    public function kelolaMakanan()
    {
        AktivitasHelper::catat('Melihat halaman kelola makanan');
        $makanans = MakananModel::latest()->paginate(10);
        return view('makanan.kelola_makanan', compact('makanans'));
    }

    public function create()
    {
        return view('makanan.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'nama_makanan' => 'required|string|max:255',
            'harga' => 'required|integer',
        ]);

        MakananModel::create($request->all());

        return redirect()->route('makanan.index')->with('success', 'Makanan berhasil ditambahkan.');
    }

    public function show(string $id)
    {
        $makanan = MakananModel::findOrFail($id);
        return view('makanan.detail', compact('makanan'));
    }

    public function edit(string $id)
    {
        $makanan = MakananModel::findOrFail($id);
        return view('makanan.edit', compact('makanan'));
    }

    public function update(Request $request, string $id)
    {
        $makanan = MakananModel::findOrFail($id);

        $request->validate([
            'nama_makanan' => 'required|string|max:255',
            'harga' => 'required|integer',
        ]);

        $makanan->update($request->all());

        return redirect()->route('makanan.index')->with('success', 'Makanan berhasil diperbarui.');
    }

    public function destroy(string $id)
    {
        $makanan = MakananModel::findOrFail($id);
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
        $makanans = MakananModel::all();
        return view('makanan.rekomendasi_makanan', compact('makanans'));
    }

    public function getRekomendasi(Request $request)
    {
        AktivitasHelper::catat("Memulai rekomendasi dengan diet: {$request->diet}");

        $request->validate([
            'budget' => 'required|numeric',
            'diet' => 'required|string',
        ]);

        $response = Http::post('http://127.0.0.1:5000/rekomendasi', [
            'budget' => (int) $request->budget,
            'preferensi_diet' => $request->diet,
        ]);

        if ($response->successful()) {
            return response()->json($response->json());
        }

        return response()->json(['error' => 'Gagal mengambil rekomendasi dari API.'], $response->status());
    }
}
