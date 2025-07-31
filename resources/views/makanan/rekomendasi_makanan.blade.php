<x-app-layout>
    <div class="min-h-screen font-sans bg-gradient-to-br from-lime-100 via-emerald-100 to-lime-200 bg-fixed bg-no-repeat bg-cover">

        <!-- Search Bar dan Input Preferensi -->
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4 mt-2">
            <form method="GET" action="{{ route('makanan.rekomendasi_makanan') }}" class="flex flex-col md:flex-row justify-center items-center gap-4">
                <!-- Search Bar -->
                <div class="relative w-full max-w-3xl">
                    <!-- Input -->
                    <input type="text" name="q" id="search-input" value="{{ request('q') }}" placeholder="Cari Makanan..."
                        class="w-full pl-14 pr-14 py-4 border-2 border-gray-200 rounded-full shadow-inner focus:outline-none focus:ring-2 focus:ring-lime-400 focus:border-transparent transition duration-300 ease-in-out text-lg placeholder-gray-400">

                    <!-- Tombol Search (jika tidak ada query) -->
                    @if(!request('q'))
                    <button type="submit" class="absolute inset-y-0 right-5 flex items-center text-gray-400 hover:text-gray-600 transition" title="Cari">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                        </svg>
                    </button>
                    @else
                    <!-- Tombol Clear (jika ada query) -->
                    <a href="{{ route('makanan.rekomendasi_makanan') }}" class="absolute inset-y-0 right-5 flex items-center text-gray-400 hover:text-red-500 transition" title="Hapus Pencarian">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M6 18L18 6M6 6l12 12" />
                        </svg>
                    </a>
                    @endif
                </div>

                <!-- Input Preferensi -->
                <!-- Tombol Preferensi -->
                <button type="button" id="openModalBtn" title="Get Recommendations" class="px-6 py-3 bg-lime-500 text-white font-semibold rounded-full shadow-md hover:bg-lime-600 transition duration-300 ease-in-out flex items-center gap-2">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6V4m0 16v-2m8-6h2M2 12H4m14.364 7.636l1.414-1.414M2.222 9.778l1.414 1.414m12.728 0l1.414-1.414M3.636 3.636l1.414 1.414M16 12a4 4 0 11-8 0 4 4 0 018 0z"></path>
                    </svg>
                    <span>Input Preferensi</span>
                </button>
            </form>
        </div>


        <!-- {{-- Grid Item Makanan --}}
        <div id="hasilRekomendasi" class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-x-6 gap-y-10 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pb-10 mt-4">
            @foreach ($makanans as $makanan)
            <a href="{{ route('makanan.show', $makanan->id) }}" class="relative bg-white rounded-2xl shadow-lg overflow-hidden group transform hover:scale-103 transition-all duration-300 ease-in-out">
                <img src="{{ $makanan->gambar }}" alt="{{ $makanan->nama_makanan }}"
                    class="w-full h-52 object-cover object-center transform group-hover:scale-110 transition-transform duration-300 ease-in-out"
                    onerror="this.onerror=null;this.src='/images/default.jpg';" />
                <div class="p-5">
                    <h3 class="font-bold text-xl text-gray-800 mb-2">{{ $makanan->nama_makanan }}</h3>
                    <div class="text-lime-700 font-bold text-lg mb-3">Rp. {{ number_format($makanan->harga, 0, ',', '.') }}</div>
                </div>
            </a>
            @endforeach
        </div> -->

        {{-- Grid Item Makanan --}}
        <div id="hasilRekomendasi" class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-x-6 gap-y-10 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pb-10 mt-4">
            {{-- PERUBAHAN TAMPILAN KARTU DIMULAI DI SINI --}}
            @foreach ($makanans as $makanan)
            <div class="bg-white rounded-2xl shadow-lg overflow-hidden group transform hover:scale-103 transition-all duration-300 ease-in-out flex flex-col">
                {{-- Gambar Utama --}}
                <a href="{{ route('makanan.show', $makanan->id) }}" class="block">
                    <img src="{{ $makanan->gambar }}" alt="{{ $makanan->nama_makanan }}"
                        class="w-full h-52 object-cover object-center transform group-hover:scale-110 transition-transform duration-300 ease-in-out"
                        onerror="this.onerror=null;this.src='/images/default.jpg';" />
                </a>

                {{-- Konten Teks --}}
                <div class="p-5 flex flex-col flex-grow">
                    <a href="{{ route('makanan.show', $makanan->id) }}">
                        <h3 class="font-bold text-xl text-gray-800 mb-2 truncate">{{ $makanan->nama_makanan }}</h3>
                    </a>

                    {{-- Spacer untuk mendorong konten ke bawah --}}
                    <div class="flex-grow"></div>

                    {{-- Info Favorit --}}
                    <div class="flex justify-between items-center mb-2 mt-4">
                        <span class="flex items-center gap-1 text-gray-600">
                            <svg class="w-4 h-4 text-red-500" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" clip-rule="evenodd" />
                            </svg>
                            <span class="text-sm font-semibold">{{ $makanan->favorits_count ?? 0 }} Orang menyukai</span>
                        </span>
                        <form action="{{ route('favorit.toggle', $makanan->id) }}" method="POST">
                            @csrf
                            <button type="submit" class="p-1.5 text-red-500 rounded-full hover:bg-red-100 transition">
                                @if(Auth::check() && Auth::user()->favoritMakanan()->where('makanan_id', $makanan->id)->exists())
                                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" clip-rule="evenodd" />
                                </svg>
                                @else
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 016.364 0L12 7.5l1.318-1.182a4.5 4.5 0 116.364 6.364L12 20.364l-7.682-7.682a4.5 4.5 0 010-6.364z" />
                                </svg>
                                @endif
                            </button>
                        </form>
                    </div>

                    {{-- Harga dan Tipe Diet --}}
                    <div class="flex justify-between items-center border-t pt-2">
                        <div class="text-lime-700 font-bold text-lg">Rp. {{ number_format($makanan->harga, 0, ',', '.') }}</div>
                        <span class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700">
                            {{ $makanan->tipe_diet }}
                        </span>
                    </div>
                </div>
            </div>
            @endforeach
            {{-- AKHIR PERUBAHAN TAMPILAN KARTU --}}
        </div>


        <!-- Pagination (akan disembunyikan jika hasil rekomendasi ditampilkan) -->
        <div id="pagination-wrapper" class="max-w-7xl mx-auto px-4 pb-10">
            {{ $makanans->appends(request()->query())->links() }}
        </div>

        {{-- Modal Preferensi --}}
        <div id="modalPreferensi"
            class="fixed inset-0 bg-black bg-opacity-60 flex justify-center items-center z-50 hidden p-4">
            <div
                class="bg-white p-8 rounded-3xl shadow-2xl w-full max-w-lg relative transform transition-all duration-300 scale-95 opacity-0 modal-active:scale-100 modal-active:opacity-100">

                <button id="closeModalBtn"
                    class="absolute top-4 right-4 text-gray-400 hover:text-gray-700 text-3xl font-light leading-none">&times;</button>

                <h3 class="text-3xl font-bold text-gray-800 mb-6 text-center">Atur Preferensi Makanan</h3>

                <form id="rekomendasiForm" class="space-y-6">
                    @csrf
                    <div>
                        <label for="budget" class="block text-base font-medium text-gray-700 mb-2">Anggaran Harian (Rp)</label>
                        <div class="flex items-center gap-3 bg-lime-50 text-lime-800 px-5 py-3 rounded-xl border border-lime-200">
                            <img src="https://img.icons8.com/ios/50/us-dollar-circled--v2.png" alt="Anggaran" class="w-7 h-7" />
                            <input type="number" id="budget" name="budget"
                                class="w-full bg-transparent border-none text-lime-800 placeholder-lime-500 focus:ring-0 appearance-none text-lg"
                                placeholder="Masukkan budget kamu" required>
                        </div>
                    </div>

                    <div>
                        <label for="diet" class="block text-base font-medium text-gray-700 mb-2">Jenis Diet</label>
                        <div class="flex items-center gap-3 bg-lime-50 text-lime-800 px-5 py-3 rounded-xl border border-lime-200">
                            <img src="https://img.icons8.com/ios/50/healthy-eating.png" alt="Diet" class="w-7 h-7" />
                            <select id="diet" name="diet"
                                class="bg-transparent border-none text-lime-800 focus:ring-0 w-full text-lg" required>
                                <option value="">-- Pilih Jenis Diet --</option>
                                <option value="Normal">Normal</option>
                                <option value="Keto">Keto</option>
                                <option value="Vegetarian">Vegetarian</option>
                                <option value="Vegan">Vegan</option>
                            </select>
                        </div>
                    </div>

                    <button type="submit"
                        class="w-full bg-lime-600 text-white font-bold py-4 rounded-xl hover:bg-lime-700 transition duration-300 ease-in-out shadow-lg text-lg mt-6">
                        Tampilkan Rekomendasi
                    </button>
                </form>
            </div>
        </div>
    </div>

    {{-- Script Modal & Rekomendasi --}}
    <script>
        // === Modal Handler (Tidak diubah) ===
        const openModalBtn = document.getElementById('openModalBtn');
        const closeModalBtn = document.getElementById('closeModalBtn');
        const modal = document.getElementById('modalPreferensi');

        const openModalWithTransition = () => {
            modal.classList.remove('hidden');
            setTimeout(() => {
                modal.querySelector('div').classList.add('modal-active:scale-100', 'modal-active:opacity-100');
                modal.querySelector('div').classList.remove('scale-95', 'opacity-0');
            }, 10);
        };
        const closeModalWithTransition = () => {
            modal.querySelector('div').classList.remove('modal-active:scale-100', 'modal-active:opacity-100');
            modal.querySelector('div').classList.add('scale-95', 'opacity-0');
            setTimeout(() => {
                modal.classList.add('hidden');
            }, 300);
        };

        openModalBtn?.addEventListener('click', openModalWithTransition);
        closeModalBtn?.addEventListener('click', closeModalWithTransition);
        modal?.addEventListener('click', (e) => {
            if (e.target === modal) {
                closeModalWithTransition();
            }
        });

        // === Submit Form Modal (AJAX) - BAGIAN INI DIPERBAIKI ===
        const form = document.getElementById('rekomendasiForm');
        const hasilRekomendasiDiv = document.getElementById('hasilRekomendasi');
        const paginationWrapper = document.getElementById('pagination-wrapper');

        form?.addEventListener('submit', function(e) {
            e.preventDefault();

            const budget = form.querySelector('input[name="budget"]').value;
            const diet = form.querySelector('select[name="diet"]').value;

            // Tampilkan pesan loading
            hasilRekomendasiDiv.innerHTML = `<div class="col-span-full text-center text-gray-500 text-lg py-10">Mencari rekomendasi terbaik untukmu...</div>`;
            if (paginationWrapper) paginationWrapper.style.display = 'none'; // Sembunyikan pagination

            fetch("{{ route('makanan.get_rekomendasi') }}", {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': document.querySelector('input[name="_token"]').value
                    },
                    body: JSON.stringify({
                        budget,
                        diet
                    })
                })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    closeModalWithTransition();
                    let html = '';

                    if (Array.isArray(data) && data.length > 0) {
                        data.forEach(item => {
                            const nama = item.nama_makanan;
                            const harga = item.harga;
                            const dietType = item.tipe_diet;
                            const gambar = item.gambar || '/images/default.jpg';
                            const id = item.id;
                            const detailUrl = `/makanan/${id}`;
                            const isFavorited = item.is_favorited;
                            const favoritsCount = item.favorits_count || 0;
                            const toggleFavoritUrl = `/makanan/${id}/toggle-favorit`;

                            const heartIcon = isFavorited ?
                                `<svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" clip-rule="evenodd" /></svg>` :
                                `<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 016.364 0L12 7.5l1.318-1.182a4.5 4.5 0 116.364 6.364L12 20.364l-7.682-7.682a4.5 4.5 0 010-6.364z" /></svg>`;

                            // PERUBAHAN TAMPILAN KARTU PADA JAVASCRIPT
                            html += `
                                <div class="bg-white rounded-2xl shadow-lg overflow-hidden group transform hover:scale-103 transition-all duration-300 ease-in-out flex flex-col">
                                    <a href="${detailUrl}" class="block">
                                        <img src="${gambar}" alt="${nama}" class="w-full h-52 object-cover object-center transform group-hover:scale-110 transition-transform duration-300 ease-in-out" onerror="this.onerror=null;this.src='/images/default.jpg';"/>
                                    </a>
                                    <div class="p-5 flex flex-col flex-grow">
                                        <a href="${detailUrl}">
                                            <h3 class="font-bold text-xl text-gray-800 mb-2 truncate">${nama}</h3>
                                        </a>
                                        <div class="flex-grow"></div>
                                        <div class="flex justify-between items-center mb-2 mt-4">
                                            <span class="flex items-center gap-1 text-gray-600">
                                                <svg class="w-4 h-4 text-red-500" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" clip-rule="evenodd" /></svg>
                                                <span class="text-sm font-semibold">${favoritsCount}</span>
                                            </span>
                                            <form action="${toggleFavoritUrl}" method="POST">
                                                <input type="hidden" name="_token" value="${document.querySelector('input[name=\'_token\']').value}">
                                                <button type="submit" class="p-1.5 text-red-500 rounded-full hover:bg-red-100 transition">
                                                    ${heartIcon}
                                                </button>
                                            </form>
                                        </div>
                                        <div class="flex justify-between items-center border-t pt-2">
                                            <div class="text-lime-700 font-bold text-lg">Rp. ${parseInt(harga).toLocaleString('id-ID')}</div>
                                            <span class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700">
                                                ${dietType}
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                `;
                        });
                    } else {
                        html = `<div class="col-span-full text-center text-gray-500 text-lg py-10">Tidak ada rekomendasi yang sesuai. Silakan ubah kriteria Anda.</div>`;
                    }
                    hasilRekomendasiDiv.innerHTML = html;
                })
                .catch(error => {
                    console.error('Error:', error);
                    hasilRekomendasiDiv.innerHTML = `<div class="col-span-full text-red-600 text-center text-lg py-10">Terjadi kesalahan saat mengambil rekomendasi. Silakan coba lagi.</div>`;
                });
        });
    </script>

    </div>
</x-app-layout>