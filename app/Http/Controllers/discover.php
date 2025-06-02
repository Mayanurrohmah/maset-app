<?php

namespace App\Http\Controllers;

use App\Models\discover;
use Illuminate\Http\Request;


class discover extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('discover.index');
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
    public function show(discover $discover)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(discover $discover)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, discover $discover)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(discover $discover)
    {
        //
    }
}
