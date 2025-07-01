<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\AktivitasUser;

class AdminController extends Controller
{
    public function dashboard()
    {
        return view('admin.dashboard');
    }

    public function userActivities()
    {
        // Logic to handle user activities
        $log = AktivitasUser::with('user')->latest()->get();
        return view('auth.user_activity', compact('log'));
        // return view('auth.user_activity'); // Assuming you have a view for user activities
    }
}
