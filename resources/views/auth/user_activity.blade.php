<x-app-layout>
    <div class="p-6 bg-white">
        <h2 class="text-2xl font-semibold mb-4">Aktivitas Pengguna</h2>

        <div class="overflow-x-auto">
            <table class="table-auto w-full border border-black text-left">
                <thead class="bg-gray-100">
                    <tr>
                        <th class="border border-black px-4 py-2">No</th>
                        <th class="border border-black px-4 py-2">Username</th>
                        <th class="border border-black px-4 py-2">Tanggal</th>
                        <th class="border border-black px-4 py-2">Aksi Dilakukan</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="border border-black px-4 py-2">1</td>
                        <td class="border border-black px-4 py-2">Maya</td>
                        <td class="border border-black px-4 py-2">2025-06-18</td>
                        <td class="border border-black px-4 py-2">Melihat rekomendasi diet Vegan</td>
                    </tr>
                    <!-- Tambahan baris jika ada aktivitas lain -->
                    <tr>
                        <td class="border border-black px-4 py-2"></td>
                        <td class="border border-black px-4 py-2"></td>
                        <td class="border border-black px-4 py-2"></td>
                        <td class="border border-black px-4 py-2"></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</x-app-layout>