<?php

namespace App\Imports;

use App\Models\MakananModel;
use Maatwebsite\Excel\Concerns\ToModel;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithSkipDuplicates;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class MakananImport implements ToCollection, WithHeadingRow
{
    /**
     * @param array $row
     *
     * @return \Illuminate\Database\Eloquent\Model|null
     */


    /**
     * Fungsi ini hanya akan mengubah file Excel/CSV menjadi sebuah Collection.
     * @param Collection $collection
     */
    public function collection(Collection $collection)
    {
        // Biarkan kosong. Logika akan dihandle di controller.
        return $collection;
    }
}
    // private function parseNumber($value)
    // {
    //     // return floatval(str_replace(',', '.', preg_replace('/[^\d,\.]/', '', $value)));
    //     $clean = preg_replace('/[^\d,\.]/', '', $value);
    //     // Ganti koma menjadi titik jika ada
    //     $clean = str_replace(',', '.', $clean);
    //     return is_numeric($clean) ? floatval($clean) : null;
    // }

    // /**
    //  * Fungsi untuk menormalisasi kunci header.
    //  * @param string $key
    //  * @return string
    //  */

    // /**
    //  * Method helper untuk memanggil API ML dan mendapatkan prediksi cluster.
    //  * @param array $data Data makanan (satu baris)
    //  * @return int Nomor cluster yang diprediksi
    //  */
    // private function getClusterFromAPI(array $data): int
    // {
    //     $apiUrl = 'http://127.0.0.1:5000/predict-food-cluster';

    //     try {
    //         $response = Http::timeout(10)->post($apiUrl, $data);

    //         if ($response->successful() && isset($response->json()['cluster'])) {
    //             return $response->json()['cluster'];
    //         }
    //     } catch (\Exception $e) {
    //         Log::error('API Call Failed during import: ' . $e->getMessage());
    //         return 0; // Cluster default jika API gagal
    //     }
    //     return 0; // Cluster default jika respons tidak berhasil
    // }



    // public function model(array $row)
    // {
    //     // if (!isset($row[0]) || $row[0] === null) {
    //     //     return null;
    //     // }

    //     // return new MakananModel([
    //     //     'nama_makanan'  => $row[0] ?? null,
    //     //     'gambar'        => $row[1] ?? null,
    //     //     'kalori'        => $this->parseNumber($row[2] ?? null),
    //     //     'karbohidrat'   => $this->parseNumber($row[3] ?? null),
    //     //     'protein'       => $this->parseNumber($row[4] ?? null),
    //     //     'harga'         => $this->parseNumber($row[5] ?? null),
    //     //     'level_harga'   => $row[6] ?? null,
    //     //     'tipe_diet'     => $row[7] ?? null,
    //     //     'cluster'       => $this->parseNumber($row[8] ?? null),
    //     //     'created_at'    => now(),
    //     //     'updated_at'    => now(),

    //     // ]);

    //     // Lewati baris jika nama makanan kosong
    //     if (!isset($row['nama_makanan']) || empty($row['nama_makanan'])) {
    //         return null;
    //     }

    //     // Siapkan data untuk model dan API
    //     $data = [
    //         'nama_makanan' => $row['nama_makanan'],
    //         'gambar'       => $row['gambar'] ?? null,
    //         'kalori'       => (float)($row['kalori'] ?? 0),
    //         'karbohidrat'  => (float)($row['karbohidrat'] ?? 0),
    //         'protein'      => (float)($row['protein'] ?? 0),
    //         'harga'        => (int)($row['harga'] ?? 0),
    //         'tipe_diet'    => $row['tipe_diet'] ?? 'Normal',
    //     ];

    //     // Panggil API untuk mendapatkan cluster
    //     $cluster = $this->getClusterFromAPI($data);

    //     // Tambahkan cluster ke data
    //     $data['cluster'] = $cluster;

    //     // Buat objek MakananModel baru.
    //     // 'level_harga' akan terisi otomatis oleh event 'saving' pada model Anda.
    //     return new MakananModel($data);
    
    // }
// }
