<x-app-layout>
    <div class="p-6 bg-white min-h-screen">
        <h1 class="text-2xl font-bold mb-6">Data Makanan</h1>

        <div class="flex items-center gap-6 mb-4">
            <a href="{{ route('makanan.create') }}" class="flex items-center gap-2 text-green-600 font-semibold">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
                </svg>
                Tambah Data baru
            </a>

            <a href="" class="flex items-center gap-2 text-green-600 font-semibold">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v6h6M20 20v-6h-6M4 14v6h6M20 10V4h-6" />
                </svg>
                Import dari CSV
            </a>
        </div>

        @if(session('success'))
        <div class="bg-green-100 text-green-800 px-4 py-2 rounded mb-4">{{ session('success') }}</div>
        @endif

        <div class="overflow-auto">
            <table class="min-w-full border border-black">
                <thead>
                    <tr class="bg-gray-200">
                        <th class="border border-black px-2 py-1">No</th>
                        <th class="border border-black px-2 py-1">Nama Makanan</th>
                        <th class="border border-black px-2 py-1">Gambar</th>
                        <th class="border border-black px-2 py-1">Kalori</th>
                        <th class="border border-black px-2 py-1">Karbohidrat</th>
                        <th class="border border-black px-2 py-1">Protein</th>
                        <th class="border border-black px-2 py-1">Harga</th>
                        <th class="border border-black px-2 py-1">Tipe Diet</th>
                        <th class="border border-black px-2 py-1">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($makanans as $index => $makanan)
                    <tr>
                        <td class="border border-black px-2 py-1">{{ $index + 1 }}</td>
                        <td class="border border-black px-2 py-1">{{ $makanan->nama_makanan }}</td>
                        <td class="border border-black px-2 py-1">
                            <img src="{{ $makanan->gambar }}" alt="{{ $makanan->nama_makanan }}" class="h-10 object-cover mx-auto" onerror="this.src='/images/default.jpg'">
                        </td>
                        <td class="border border-black px-2 py-1">{{ $makanan->kalori }}</td>
                        <td class="border border-black px-2 py-1">{{ $makanan->karbohidrat }}</td>
                        <td class="border border-black px-2 py-1">{{ $makanan->protein }}</td>
                        <td class="border border-black px-2 py-1">Rp. {{ number_format($makanan->harga, 0, ',', '.') }}</td>
                        <td class="border border-black px-2 py-1">{{ $makanan->tipe_diet }}</td>
                        <td class="border border-black px-2 py-1 text-center">
                            <a href="{{ route('makanan.edit', $makanan) }}" class="text-yellow-500 mr-2" title="Edit">
                                ✏️
                            </a>
                            <form action="{{ route('makanan.destroy', $makanan->id) }}" method="POST" class="inline" onsubmit="return confirm('Yakin hapus?')">
                                 @csrf
                                  @method('DELETE')
                                  <button type="submit" class="text-red-500" title="Hapus">🗑️</button>
                                </form>

                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>

        <div class="mt-4">
            {{ $makanans->links() }}
        </div>
        
        <div class="mt-6 text-right">
            <a href="{{ route('makanan.dashboard') }}" class="inline-flex items-center bg-lime-500 hover:bg-lime-600 text-white px-4 py-2 rounded-full">
                ✅ Selesai
            </a>
        </div>
    </div>
</x-app-layout>