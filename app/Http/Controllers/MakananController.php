<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class MakananController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('makanan.index'); // Assuming you have a view for listing Makanan
    }

    public function kelolaMakanan()
    {
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
        // Logic to handle the listing of favorite Makanan
        return view('makanan.favorit'); // Assuming you have a view for listing favorite Makanan
    }
}
