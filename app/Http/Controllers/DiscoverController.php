<?php

namespace App\Http\Controllers;

use App\Models\DiscoverModel;
use Illuminate\Http\Request;

class DiscoverController extends Controller
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
    public function show(DiscoverModel $discoverModel)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(DiscoverModel $discoverModel)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, DiscoverModel $discoverModel)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(DiscoverModel $discoverModel)
    {
        //
    }
}
