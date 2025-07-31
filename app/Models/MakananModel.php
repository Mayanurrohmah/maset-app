<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MakananModel extends Model
{
    use HasFactory;
    protected $table = 'makanan';
    protected $fillable = [
        'nama_makanan',
        'gambar',
        'kalori',
        'karbohidrat',
        'protein',
        'harga',
        'level_harga',
        'tipe_diet',
        'cluster',
    ];

    protected static function boot()
    {
        parent::boot();

        // Event ini akan berjalan setiap kali data akan disimpan (baik create maupun update)
        static::saving(function ($makanan) {
            if ($makanan->harga < 19000) {
                $makanan->level_harga = 'Normal';
            } elseif ($makanan->harga <= 39000) {
                $makanan->level_harga = 'Mahal';
            } else {
                $makanan->level_harga = 'Premium';
            }
        });
    }

    public function disukaiOleh()
    {
        return $this->belongsToMany(User::class, 'favorit', 'user_id', 'makanan_id');
    }

    public function favorits()
    {
        return $this->hasMany(Favorit::class, 'makanan_id');
    }
}
