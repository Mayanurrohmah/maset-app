<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AktivitasUser extends Model
{
    use HasFactory;

    
    public $timestamps = false;

    protected $fillable = ['user_id', 'aksi', 'created_at'];

     protected $casts = [
        'created_at' => 'datetime', // ✅ Ini penting agar bisa pakai ->translatedFormat()
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
