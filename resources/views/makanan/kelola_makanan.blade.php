<x-app-layout>
    <div class="p-6 bg-white shadow-md rounded-md">
        <h2 class="text-2xl font-semibold mb-4">Data Makanan</h2>

        <div class="flex items-center gap-4 mb-6">
            <!-- Tombol Tambah Data Baru -->
            <button class="flex items-center px-4 py-2 bg-green-500 text-white rounded hover:bg-green-600">
                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4" />
                </svg>
                Tambah Data baru
            </button>

            <!-- Tombol Import CSV -->
            <button class="flex items-center px-4 py-2 bg-teal-500 text-white rounded hover:bg-teal-600">
                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4" />
                </svg>
                Import dari CSV
            </button>
        </div>

        <!-- Tabel Data Makanan -->
        <div class="overflow-x-auto">
            <table class="w-full table-auto border border-gray-300 text-sm text-center">
                <thead class="bg-gray-100">
                    <tr>
                        <th class="border px-2 py-2">No</th>
                        <th class="border px-2 py-2">Nama Makanan</th>
                        <th class="border px-2 py-2">Jumlah</th>
                        <th class="border px-2 py-2">Karbohidrat</th>
                        <th class="border px-2 py-2">Lemak</th>
                        <th class="border px-2 py-2">Protein</th>
                        <th class="border px-2 py-2">Harga</th>
                        <th class="border px-2 py-2">Tipe Diet</th>
                        <th class="border px-2 py-2">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Contoh data dummy -->
                    @for ($i = 1; $i <= 5; $i++)
                        <tr>
                        <td class="border px-2 py-1">{{ $i }}</td>
                        <td class="border px-2 py-1">Makanan {{ $i }}</td>
                        <td class="border px-2 py-1">100g</td>
                        <td class="border px-2 py-1">20g</td>
                        <td class="border px-2 py-1">10g</td>
                        <td class="border px-2 py-1">5g</td>
                        <td class="border px-2 py-1">Rp10.000</td>
                        <td class="border px-2 py-1">Keto</td>
                        <td class="border px-2 py-1 space-x-2">
                            <button class="text-blue-500 hover:underline" title="Edit">
                                ✏️
                            </button>
                            <button class="text-red-500 hover:underline" title="Delete">
                                🗑️
                            </button>
                        </td>
                        </tr>
                        @endfor
                </tbody>
            </table>
        </div>

        <!-- Tombol Selesai -->
        <div class="mt-6 text-right">
            <button class="flex items-center gap-2 px-5 py-2 bg-lime-500 text-white rounded hover:bg-lime-600">
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M10 18a8 8 0 100-16 8 8 0 000 16zm1.707-9.293a1 1 0 00-1.414-1.414L9 8.586 8.707 8.293a1 1 0 00-1.414 1.414L9 11.414l3.707-3.707z" />
                </svg>
                Selesai
            </button>
        </div>
    </div>
</x-app-layout>