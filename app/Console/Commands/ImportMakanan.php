<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\MakananModel;
use Illuminate\Support\Facades\DB;

class ImportMakanan extends Command
{
 
    protected $signature = 'import:makanan';
    protected $description = 'Import data makanan dari CSV';

    public function handle()
    {
        $csv = fopen(storage_path('app/data_makanan_clustered.csv'), 'r');
        fgetcsv($csv); // skip header

        while (($row = fgetcsv($csv)) !== false) {
            MakananModel::create([
                'nama_makanan' => $row[0],
                'gambar' => $row[1],
                'kalori' => $row[2],
                'karbohidrat' => $row[3],
                'protein' => $row[4],
                'harga' => $row[5],
                'level_harga' => $row[6],
                'tipe_diet' => $row[7],
                'cluster' => $row[8],
            ]);
        }

        fclose($csv);
        $this->info('✅ Data makanan berhasil diimport.');
    }
}
