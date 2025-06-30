<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function dashboard()
    {
        return view('admin.dashboard');
    }

    public function userActivities()
    {
        // Logic to handle user activities
        return view('auth.user_activity'); // Assuming you have a view for user activities
    }
}
