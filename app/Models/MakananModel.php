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

    public function disukaiOleh()
    {
        return $this->belongsToMany(User::class, 'favorit', 'user_id', 'makanan_id');
    }
}
