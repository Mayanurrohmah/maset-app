<x-app-layout>
    <div class="min-h-screen font-sans bg-gradient-to-br from-lime-100 via-emerald-100 to-lime-200 bg-fixed bg-no-repeat bg-cover">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8 bg-white rounded-2xl shadow-xl mt-8 mb-8">
            <h2 class="text-3xl font-extrabold text-gray-800 mb-8 text-center">Makanan Favorit Anda</h2>

            <!-- <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-x-6 gap-y-10">
                @forelse ($favorit as $makanan)
                <a href="{{ route('makanan.show', $makanan->id) }}" class="relative bg-white rounded-2xl shadow-lg overflow-hidden group transform hover:scale-103 transition-all duration-300 ease-in-out">
                    <img src="{{ $makanan->gambar }}" alt="{{ $makanan->nama_makanan }}"
                        class="w-full h-52 object-cover object-center transform group-hover:scale-110 transition-transform duration-300 ease-in-out"
                        onerror="this.onerror=null;this.src='/images/default.jpg';" />

                    <div class="p-5">
                        <h3 class="font-bold text-xl text-gray-800 mb-1">{{ $makanan->nama_makanan }}</h3>
                        <p class="text-lime-700 font-semibold text-sm">Rp {{ number_format($makanan->harga, 0, ',', '.') }}</p>

                        @if(Auth::user()->jabatan === 'admin')
                        <p class="text-sm text-gray-500">Disimpan oleh: {{ $item->user->name }}</p>
                        @endif

                    </div>
                </a>
                @empty
                <div class="col-span-full text-center text-gray-600 py-12 text-xl italic">
                    <svg class="mx-auto h-16 w-16 text-gray-400 mb-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                    </svg>
                    <p>Belum ada makanan favorit yang disimpan.</p>
                    <p class="mt-2 text-lg">Cari dan simpan makanan yang Anda suka!</p>
                    <a href="{{ route('makanan.rekomendasi_makanan') }}" class="mt-6 inline-flex items-center px-6 py-3 border border-transparent text-base font-medium rounded-full shadow-sm text-white bg-lime-600 hover:bg-lime-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-lime-500 transition duration-200">
                        Temukan Rekomendasi
                    </a>
                </div>
                @endforelse
            </div> -->

            <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-x-6 gap-y-10">
                @forelse ($favorit as $item)
                <a href="{{ route('makanan.show', $item->makanan->id) }}" class="relative bg-white rounded-2xl shadow-lg overflow-hidden group transform hover:scale-103 transition-all duration-300 ease-in-out">
                    <img src="{{ $item->makanan->gambar }}" alt="{{ $item->makanan->nama_makanan }}"
                        class="w-full h-52 object-cover object-center transform group-hover:scale-110 transition-transform duration-300 ease-in-out"
                        onerror="this.onerror=null;this.src='/images/default.jpg';" />

                    <div class="p-5">
                        <h3 class="font-bold text-xl text-gray-800 mb-1">{{ $item->makanan->nama_makanan }}</h3>
                        <p class="text-lime-700 font-semibold text-sm">Rp {{ number_format($item->makanan->harga, 0, ',', '.') }}</p>

                        @if(Auth::user()->role === 'admin')
                        <p class="text-sm text-gray-500">Disimpan oleh: {{ $item->user->name }}</p>
                        @endif

                    </div>
                </a>
                @empty
                <div class="col-span-full text-center text-gray-600 py-12 text-xl italic">
                    <svg class="mx-auto h-16 w-16 text-gray-400 mb-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                    </svg>
                    <p>Belum ada makanan favorit yang disimpan.</p>
                    <p class="mt-2 text-lg">Cari dan simpan makanan yang Anda suka!</p>
                    <a href="{{ route('makanan.rekomendasi_makanan') }}" class="mt-6 inline-flex items-center px-6 py-3 border border-transparent text-base font-medium rounded-full shadow-sm text-white bg-lime-600 hover:bg-lime-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-lime-500 transition duration-200">
                        Temukan Rekomendasi
                    </a>
                </div>
                @endforelse
            </div>
        </div>
    </div>
</x-app-layout>