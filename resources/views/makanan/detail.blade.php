<x-app-layout>
    <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-8 bg-white rounded-2xl shadow-xl mt-8 mb-8"> {{-- Reduced max-width, padding, and vertical margins --}}

        <div class="mb-6"> {{-- Slightly reduced margin-bottom --}}
            <a href="{{ route('makanan.rekomendasi_makanan') }}" class="inline-flex items-center text-gray-700 hover:text-lime-600 transition-colors duration-200 font-medium text-base"> {{-- Reduced text size --}}
                <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"> {{-- Reduced icon size --}}
                    <path stroke-linecap="round" stroke-linejoin="round" d="M10.5 19.5L3 12m0 0l7.5-7.5M3 12h18" />
                </svg>
                Kembali ke Rekomendasi
            </a>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 items-start"> {{-- Reduced gap, changed to md:grid-cols-2 for common screen sizes --}}
            <div class="flex flex-col items-center p-3 bg-gray-50 rounded-xl shadow-inner border border-gray-100"> {{-- Reduced padding, rounded-ness --}}
                <div class="w-full relative overflow-hidden rounded-lg shadow-md border border-gray-200 group"> {{-- Reduced rounded-ness and shadow --}}
                    <img src="{{ $makanan->gambar }}" alt="{{ $makanan->nama_makanan }}"
                        class="w-full h-64 object-cover object-center rounded-lg transform group-hover:scale-105 transition-transform duration-300 ease-in-out" {{-- Reduced image height --}}
                        onerror="this.onerror=null;this.src='/images/default.jpg';" />
                    
                    {{-- Price Tag Overlay --}}
                    <div class="absolute bottom-3 left-3 bg-white bg-opacity-90 text-lime-700 font-extrabold px-4 py-2 rounded-full shadow-md text-xl tracking-normal"> {{-- Reduced padding, font size, and tracking --}}
                        Rp {{ number_format($makanan->harga, 0, ',', '.') }}
                    </div>
                </div>

                <div class="mt-6"> {{-- Reduced margin-top --}}
                    <form method="POST" action="{{ route('favorit.toggle', $makanan->id) }}">
                        @csrf
                        <button type="submit" class="flex items-center gap-2 px-6 py-2 rounded-full text-base font-semibold transition-all duration-300 ease-in-out
                            @if(auth()->user() && auth()->user()->favoritMakanan->contains($makanan->id))
                                bg-lime-600 text-white shadow-md hover:bg-lime-700
                            @else
                                bg-gray-100 text-gray-700 border border-gray-300 hover:bg-gray-200
                            @endif
                        ">
                            @if(auth()->user() && auth()->user()->favoritMakanan->contains($makanan->id))
                                <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                                    <path d="M17.593 3.322c1.1.128 1.907 1.077 1.907 2.185V21L12 17.25 4.5 21V5.507c0-1.108.806-2.057 1.907-2.185a48.507 48.507 0 0 1 11.186 0Z" />
                                </svg>
                                <span>Disimpan</span>
                            @else
                                <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M17.593 3.322c1.1.128 1.907 1.077 1.907 2.185V21L12 17.25 4.5 21V5.507c0-1.108.806-2.057 1.907-2.185a48.507 48.507 0 0 1 11.186 0Z" />
                                </svg>
                                <span>Simpan</span>
                            @endif
                        </button>
                    </form>
                </div>
            </div>

            <div class="bg-gray-50 rounded-xl p-6 shadow-md border border-gray-100"> {{-- Reduced padding, shadow, and rounded-ness --}}
                <h1 class="text-3xl font-bold text-lime-700 mb-2">{{ $makanan->nama_makanan }}</h1> {{-- Reduced font size and boldness --}}
                <p class="text-sm text-gray-600 mb-4 border-b pb-3 border-gray-200">Informasi nutrisi dan preferensi makanan</p> {{-- Reduced font size, padding --}}
                
                <ul class="space-y-4 text-base text-gray-800"> {{-- Reduced spacing and font size for list items --}}
                    <li class="flex justify-between items-center pb-2">
                        <span class="flex items-center gap-2 font-medium">🔥 Kalori</span>
                        <span class="font-semibold text-gray-900">{{ $makanan->kalori ?? '-' }} kcal</span>
                    </li>
                    <li class="flex justify-between items-center pb-2">
                        <span class="flex items-center gap-2 font-medium">🍚 Karbohidrat</span>
                        <span class="font-semibold text-gray-900">{{ $makanan->karbohidrat ?? '-' }} g</span>
                    </li>
                    <li class="flex justify-between items-center pb-2">
                        <span class="flex items-center gap-2 font-medium">🍗 Protein</span>
                        <span class="font-semibold text-gray-900">{{ $makanan->protein ?? '-' }} g</span>
                    </li>
                    <li class="flex justify-between items-center pb-2">
                        <span class="flex items-center gap-2 font-medium">🥗 Tipe Diet</span>
                        <span class="font-semibold text-lime-600">{{ $makanan->tipe_diet }}</span>
                    </li>
                    <li class="flex justify-between items-center">
                        <span class="flex items-center gap-2 font-medium">💰 Level Harga</span>
                        <span class="capitalize font-semibold text-gray-900">{{ $makanan->level_harga }}</span>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</x-app-layout>