<?php
namespace App\Helpers;

use App\Models\AktivitasUser;
use Illuminate\Support\Facades\Auth;

class AktivitasHelper
{
    public static function catat($aksi)
    {
        if (Auth::check()) {
            AktivitasUser::create([
                'user_id' => Auth::id(),
                'aksi'    => $aksi,
            ]);
        }
    }
}
