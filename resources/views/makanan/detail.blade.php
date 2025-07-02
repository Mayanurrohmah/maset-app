<x-app-layout>
    <div class="max-w-4xl mx-auto p-6 bg-white rounded-lg shadow mt-6">
        <div class="text-sm text-gray-400 font-semibold mb-4">Detail Makanan</div>

        <div class="flex items-center mb-6">
            <a href="{{ route('makanan.rekomendasi_makanan') }}" class="text-lg font-semibold flex items-center text-gray-700 hover:text-lime-600">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M10.5 19.5 3 12m0 0 7.5-7.5M3 12h18" />
                </svg>

                Kembali ke Rekomendasi Makanan
            </a>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 items-center">
            <!-- Gambar Makanan -->
            <div class="text-center">
                <img src="{{ $makanan->gambar }}" alt="{{ $makanan->nama_makanan }}"
                    class="mx-auto max-h-60 object-contain rounded"
                    onerror="this.onerror=null;this.src='/images/default.jpg';" />
                <div class="flex justify-center items-center mt-4 gap-2">
                    <form method="POST" action="{{ route('favorit.toggle', $makanan->id) }}">
                        @csrf
                        <button type="submit" class="mt-4 flex items-center gap-2 text-gray-600 hover:text-lime-500">
                            @if(auth()->user() && auth()->user()->favoritMakanan->contains($makanan->id))
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                                <path stroke-linecap="round" stroke-linejoin="round" d="m3 3 1.664 1.664M21 21l-1.5-1.5m-5.485-1.242L12 17.25 4.5 21V8.742m.164-4.078a2.15 2.15 0 0 1 1.743-1.342 48.507 48.507 0 0 1 11.186 0c1.1.128 1.907 1.077 1.907 2.185V19.5M4.664 4.664 19.5 19.5" />
                            </svg>

                            <span>Disimpan</span>
                            @else
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M17.593 3.322c1.1.128 1.907 1.077 1.907 2.185V21L12 17.25 4.5 21V5.507c0-1.108.806-2.057 1.907-2.185a48.507 48.507 0 0 1 11.186 0Z" />
                            </svg>

                            <span>Simpan</span>
                            @endif
                        </button>
                    </form>
                    <p class="text-lg font-semibold">Rp. {{ number_format($makanan->harga, 0, ',', '.') }}</p>

                </div>
            </div>

            <!-- Informasi Nutrisi -->
            <div>
                <h1 class="text-2xl font-bold mb-2 text-center md:text-left">{{ $makanan->nama_makanan }}</h1>
                <h3 class="text-xl font-semibold mb-4 text-center md:text-left">Informasi Detail</h3>
                <ul class="space-y-3 text-sm text-gray-700">
                    <li class="flex justify-between">
                        <span>◯ Kalori</span>
                        <span>{{ $makanan->kalori ?? '-' }} kcal</span>
                    </li>
                    <li class="flex justify-between">
                        <span>◯ Karbohidrat</span>
                        <span>{{ $makanan->karbohidrat ?? '-' }} g</span>
                    </li>
                    <li class="flex justify-between">
                        <span>◯ Lemak</span>
                        <span>{{ $makanan->lemak ?? '-' }} g</span>
                    </li>
                    <li class="flex justify-between">
                        <span>◯ Protein</span>
                        <span>{{ $makanan->protein ?? '-' }} g</span>
                    </li>
                    <li class="flex justify-between">
                        <span>◯ Tipe Diet</span>
                        <span>{{ $makanan->tipe_diet }}</span>
                    </li>
                    <li class="flex justify-between">
                        <span>◯ Level Harga</span>
                        <span>{{ $makanan->level_harga }}</span>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</x-app-layout>