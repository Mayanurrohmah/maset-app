<?php

namespace App\Imports;

use App\Models\MakananModel;
use Maatwebsite\Excel\Concerns\ToModel;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithSkipDuplicates;

class MakananImport implements ToModel
{
    /**
     * @param array $row
     *
     * @return \Illuminate\Database\Eloquent\Model|null
     */

    private function parseNumber($value)
    {
        // return floatval(str_replace(',', '.', preg_replace('/[^\d,\.]/', '', $value)));
        $clean = preg_replace('/[^\d,\.]/', '', $value);
        // Ganti koma menjadi titik jika ada
        $clean = str_replace(',', '.', $clean);
        return is_numeric($clean) ? floatval($clean) : null;
    }

    /**
     * Fungsi untuk menormalisasi kunci header.
     * @param string $key
     * @return string
     */



    public function model(array $row)
    {
        if (!isset($row[0]) || $row[0] === null) {
            return null;
        }

        return new MakananModel([
            'nama_makanan'  => $row[0] ?? null,
            'gambar'        => $row[1] ?? null,
            'kalori'        => $this->parseNumber($row[2] ?? null),
            'karbohidrat'   => $this->parseNumber($row[3] ?? null),
            'protein'       => $this->parseNumber($row[4] ?? null),
            'harga'         => $this->parseNumber($row[5] ?? null),
            'level_harga'   => $row[6] ?? null,
            'tipe_diet'     => $row[7] ?? null,
            'cluster'       => $this->parseNumber($row[8] ?? null),
            'created_at'    => now(),
            'updated_at'    => now(),
            // menggunakan nama kolom yang lebih fleksibel
            // 'nama_makanan'  => $row['nama_makanan'] ?? $row['Nama Makanan'] ?? $row['nama makanan'] ?? $row['makanan'] ?? null,
            // 'gambar'        => $row['gambar'] ?? $row['Gambar'] ?? $row['picture'] ?? $row['image'] ?? null,
            // 'kalori'        => $this->parseNumber($row['kalori'] ?? $row['Kalori'] ?? $row['calories'] ?? null),
            // 'karbohidrat'   => $this->parseNumber($row['karbohidrat'] ?? $row['Karbohidrat'] ?? $row['carbs'] ?? null),
            // 'protein'       => $this->parseNumber($row['protein'] ?? $row['Protein'] ?? null),
            // 'harga'         => $this->parseNumber($row['harga'] ?? $row['Harga (Rp)'] ?? $row['Harga'] ?? $row['price'] ?? null),
            // 'level_harga'   => $row['level_harga'] ?? $row['Level Harga'] ?? null,
            // 'tipe_diet'     => $row['tipe_diet'] ?? $row['tipe diet'] ?? $row['Type_Diet'] ?? null,
            // // Pastikan kolom 'cluster' di file CSV Anda berisi angka
            // 'cluster'       => $this->parseNumber($row['cluster'] ?? $row['Cluster'] ?? null),

            // 'nama_makanan'  => $row['nama_makanan'] ?? null,
            // 'gambar'        => $row['gambar'] ?? null,
            // 'kalori'        => $this->parseNumber($row['kalori'] ?? null),
            // 'karbohidrat'   => $this->parseNumber($row['karbohidrat'] ?? null),
            // 'protein'       => $this->parseNumber($row['protein'] ?? null),
            // 'harga'         => $this->parseNumber($row['harga'] ?? null),
            // 'level_harga'   => $row['level_harga']  ?? null,
            // 'tipe_diet'     => $row['tipe_diet'] ?? null,
            // // Pastikan kolom 'cluster' di file CSV Anda berisi angka
            // 'cluster'       => $this->parseNumber($row['cluster'] ?? null),

        ]);
    }

    // public function model(array $row)
    // {
    //     // 1. Buat array baru dengan semua kunci (header) yang sudah dinormalisasi.
    //     $normalizedRow = [];
    //     foreach ($row as $key => $value) {
    //         $normalizedRow[$this->normalizeKey($key)] = $value;
    //     }

    //     // 2. Definisikan pemetaan dari nama kolom database ke kemungkinan nama header (yang sudah dinormalisasi).
    //     $columnMapping = [
    //         'nama_makanan' => ['nama_makanan', 'makanan', 'food_name', 'nama_produk'],
    //         'gambar'       => ['gambar', 'picture', 'image'],
    //         'kalori'       => ['kalori', 'calories'],
    //         'karbohidrat'  => ['karbohidrat', 'karbo', 'carbs', 'carbohydrate'],
    //         'protein'      => ['protein'],
    //         'harga'        => ['harga', 'price', 'harga_(rp)'],
    //         'level_harga'  => ['level_harga', 'price_level'],
    //         'tipe_diet'    => ['tipe_diet', 'diet_type'],
    //         'cluster'      => ['cluster'],
    //     ];

    //     // 3. Ambil data menggunakan pemetaan untuk fleksibilitas maksimum.
    //     $data = [];
    //     foreach ($columnMapping as $dbColumn => $possibleNormalizedKeys) {
    //         $data[$dbColumn] = null; // Set nilai default
    //         foreach ($possibleNormalizedKeys as $key) {
    //             if (isset($normalizedRow[$key])) {
    //                 $data[$dbColumn] = $normalizedRow[$key];
    //                 break; // Hentikan pencarian jika sudah ditemukan
    //             }
    //         }
    //     }

    //     // 4. Cek jika data penting kosong, lewati baris ini. INI ADALAH PENGAMAN ANDA.
    //     if (empty($data['nama_makanan'])) {
    //         return null;
    //     }

    //     // 5. Buat model dengan data yang sudah bersih dan terstruktur
    //     return new MakananModel([
    //         'nama_makanan'  => $data['nama_makanan'],
    //         'gambar'        => $data['gambar'],
    //         'kalori'        => $this->parseNumber($data['kalori']),
    //         'karbohidrat'   => $this->parseNumber($data['karbohidrat']),
    //         'protein'       => $this->parseNumber($data['protein']),
    //         'harga'         => $this->parseNumber($data['harga']), // Menggunakan parseNumber lagi untuk konsistensi
    //         'level_harga'   => $data['level_harga'],
    //         'tipe_diet'     => $data['tipe_diet'],
    //         'cluster'       => $this->parseNumber($data['cluster']),
    //     ]);
    // }
}
