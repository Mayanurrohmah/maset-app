<x-app-layout>
    <div class="min-h-screen font-sans bg-gradient-to-br from-lime-100 via-emerald-100 to-lime-200 bg-fixed bg-no-repeat bg-cover">

        {{-- Search Bar dan Input Preferensi di Tengah --}}
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4 mt-2">
            <div class="flex flex-col md:flex-row justify-center md:justify-center items-center gap-4">
                
                {{-- Search Bar --}}
                <div class="relative w-full max-w-3xl">
                    <span class="absolute inset-y-0 left-0 flex items-center pl-5">
                        <svg class="w-6 h-6 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                        </svg>
                    </span>
                    <input type="text" placeholder="Cari Makanan..."
                        class="w-full pl-14 pr-6 py-4 border-2 border-gray-200 rounded-full shadow-inner focus:outline-none focus:ring-2 focus:ring-lime-400 focus:border-transparent transition duration-300 ease-in-out text-lg placeholder-gray-400">
                </div>
                
                {{-- Tombol Input Preferensi --}}
                <button id="openModalBtn" title="Get Recommendations" class="px-6 py-3 bg-lime-500 text-white font-semibold rounded-full shadow-md hover:bg-lime-600 transition duration-300 ease-in-out flex items-center gap-2">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6V4m0 16v-2m8-6h2M2 12H4m14.364 7.636l1.414-1.414M2.222 9.778l1.414 1.414m12.728 0l1.414-1.414M3.636 3.636l1.414 1.414M16 12a4 4 0 11-8 0 4 4 0 018 0z"></path>
                    </svg>
                    <span>Input Preferensi</span>
                </button>
            </div>
        </div>

        {{-- Grid Item Makanan --}}
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
        </div>

        {{-- Modal Preferensi --}}
        <div id="modalPreferensi"
            class="fixed inset-0 bg-black bg-opacity-60 flex justify-center items-center z-50 hidden p-4">
            <div
                class="bg-white p-8 rounded-3xl shadow-2xl w-full max-w-lg relative transform transition-all duration-300 scale-95 opacity-0 modal-active:scale-100 modal-active:opacity-100">

                <button id="closeModalBtn"
                    class="absolute top-4 right-4 text-gray-400 hover:text-gray-700 text-3xl font-light leading-none">&times;</button>

                <h3 class="text-3xl font-bold text-gray-800 mb-6 text-center">Atur Preferensi Makanan</h3>

                <form method="POST" action="" class="space-y-6">
                    @csrf
                    <div>
                        <label for="budget" class="block text-base font-medium text-gray-700 mb-2">Anggaran Harian
                            (Rp)</label>
                        <div
                            class="flex items-center gap-3 bg-lime-50 text-lime-800 px-5 py-3 rounded-xl border border-lime-200">
                            <img src="https://img.icons8.com/ios/50/us-dollar-circled--v2.png" alt="Anggaran"
                                class="w-7 h-7" />
                            <input type="number" id="budget" name="budget"
                                class="w-full bg-transparent border-none text-lime-800 placeholder-lime-500 focus:ring-0 appearance-none text-lg"
                                placeholder="Masukkan budget kamu" required>
                        </div>
                    </div>

                    <div>
                        <label for="diet" class="block text-base font-medium text-gray-700 mb-2">Jenis Diet</label>
                        <div
                            class="flex items-center gap-3 bg-lime-50 text-lime-800 px-5 py-3 rounded-xl border border-lime-200">
                            <img src="https://img.icons8.com/ios/50/healthy-eating.png" alt="Diet"
                                class="w-7 h-7" />
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

        {{-- Script Modal & Rekomendasi --}}
        <script>
            const openModal = document.getElementById('openModalBtn');
            const closeModal = document.getElementById('closeModalBtn');
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

            openModal.addEventListener('click', openModalWithTransition);
            closeModal.addEventListener('click', closeModalWithTransition);
            modal.addEventListener('click', (e) => {
                if (e.target === modal) {
                    closeModalWithTransition();
                }
            });

            @if(request('showModal') === 'true')
            window.addEventListener('DOMContentLoaded', () => openModalWithTransition());
            @endif

            const form = document.querySelector('#modalPreferensi form');
            const hasilRekomendasi = document.getElementById('hasilRekomendasi');

            form.addEventListener('submit', function(e) {
                e.preventDefault();

                const budget = form.querySelector('input[name="budget"]').value;
                const diet = form.querySelector('select[name="diet"]').value;

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
                    .then(response => response.json())
                    .then(data => {
                        closeModalWithTransition();
                        let html = '';
                        let hasil = data.rekomendasi.length ? data.rekomendasi : data.saran;

                        if (data.message) {
                            html += `<div class="col-span-full text-center text-yellow-700 font-semibold text-lg mb-4">${data.message}</div>`;
                        }

                        if (hasil.length === 0) {
                            html += `<div class="col-span-full text-center text-gray-500 text-lg py-10">Tidak ada rekomendasi yang sesuai. Silakan ubah kriteria Anda.</div>`;
                        } else {
                            hasil.forEach(item => {
                                const nama = item["Nama Makanan"];
                                const harga = item["Harga (Rp)"];
                                const dietType = item["Tipe Diet"] || '';
                                const gambar = item["Gambar"] || '/images/default.jpg';

                                html += `
                                    <a href="/makanan/${item.id || ''}" class="relative bg-white rounded-2xl shadow-lg overflow-hidden group transform hover:scale-103 transition-all duration-300 ease-in-out">
                                        <img src="${gambar}" class="w-full h-52 object-cover object-center transform group-hover:scale-110 transition-transform duration-300 ease-in-out" onerror="this.onerror=null;this.src='/images/default.jpg';"/>
                                        <div class="p-5">
                                            <h3 class="font-bold text-xl text-gray-800 mb-2">${nama}</h3>
                                            <div class="text-lime-700 font-bold text-lg mb-3">Rp. ${parseInt(harga).toLocaleString()}</div>
                                            ${dietType ? `<span class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mt-2">${dietType}</span>` : ''}
                                        </div>
                                    </a>
                                `;
                            });
                        }
                        hasilRekomendasi.innerHTML = html;
                    })
                    .catch(error => {
                        console.error(error);
                        hasilRekomendasi.innerHTML =
                            `<div class="col-span-full text-red-600 text-center text-lg py-10">Terjadi kesalahan saat mengambil rekomendasi. Silakan coba lagi.</div>`;
                    });
            });
        </script>
    </div>
</x-app-layout>
