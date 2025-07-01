<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Helpers\AktivitasHelper;

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
        return view('makanan.kelola_makanan'); // Assuming you have a view for listing Makanan
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        // AktivitasHelper::catat("Melihat detail makanan: {$makanan->nama}");
        // return view('makanan.detail', ['id' => $id]); // Assuming you have a view for showing Makanan details
        return view('makanan.detail'); // Assuming you have a view for showing Makanan details
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function favorit()
    {
         AktivitasHelper::catat('Melihat halaman favorit makanan');
        // Logic to handle the listing of favorite Makanan
        return view('makanan.favorit'); // Assuming you have a view for listing favorite Makanan
    }

    public function rekomendasiMakanan()
    {
        AktivitasHelper::catat('Melihat halaman rekomendasi makanan');
        // Logic to handle the listing of recommended Makanan
        return view('makanan.rekomendasi_makanan'); // Assuming you have a view for listing recommended Makanan
    }

    public function prosesRekomendasi(Request $request)
    {
        // Simpan preferensi ke session atau database...
        AktivitasHelper::catat("Memulai rekomendasi dengan diet: {$request->diet}");

        return redirect()->route('makanan.rekomendasi_makanan', ['showModal' => 'true']);
    }
}
