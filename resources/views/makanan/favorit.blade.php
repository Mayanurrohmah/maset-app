<x-app-layout>
    <div class="p-6 max-w-6xl mx-auto">
        <h2 class="text-2xl font-bold mb-4">Makanan Favorit</h2>

        <div class="grid grid-cols-2 sm:grid-cols-4 gap-4">
            @forelse ($favorit as $makanan)
                <a href="{{ route('makanan.show', $makanan->id) }}" class="text-center">
                    <img src="{{ $makanan->gambar }}" class="h-28 mx-auto object-cover rounded" />
                    <p class="font-semibold">{{ $makanan->nama_makanan }}</p>
                    <p class="text-sm text-gray-600">Rp. {{ number_format($makanan->harga, 0, ',', '.') }}</p>
                </a>
            @empty
                <div class="col-span-full text-center text-gray-500">Belum ada makanan favorit.</div>
            @endforelse
        </div>
    </div>
</x-app-layout>
