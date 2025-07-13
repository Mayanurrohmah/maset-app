<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('makanan', function (Blueprint $table) {
            $table->id();
            $table->string('nama_makanan');
            $table->text('gambar')->nullable();
            $table->float('kalori')->nullable();
            $table->float('karbohidrat')->nullable();
            $table->float('protein')->nullable();
            $table->integer('harga')->nullable();
            $table->string('level_harga')->nullable();
            $table->string('tipe_diet')->nullable();
            $table->integer('cluster')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('makanan');
    }
};
