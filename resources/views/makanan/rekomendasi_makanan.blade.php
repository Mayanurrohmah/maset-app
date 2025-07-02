<x-app-layout>
    <div class="p-6 bg-white relative">
        <!-- Tombol Buka Modal -->
        <!-- <div class="flex justify-end mb-4">
            <button id="openModalBtn" class="bg-lime-500 text-white px-4 py-2 rounded hover:bg-lime-600">
                Input Preferensi
            </button>
        </div>

        <div class="flex items-center mb-6">           
            <input type="text" placeholder="Cari Makanan"
                class="w-full max-w-md px-4 py-2 border rounded-full shadow" />
        </div> -->

        {{-- Header: Tombol Menu (Hamburger) dan Bar Pencarian --}}
        <div class="flex items-center justify-between mb-6 gap-4">
            <div class="relative flex-grow">
                <span class="absolute inset-y-0 left-0 flex items-center pl-4">
                    <svg class="w-5 h-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                    </svg>
                </span>
                <input type="text" placeholder="Cari Makanan" class="w-full pl-12 pr-4 py-3 border-2 border-gray-300 rounded-full shadow-sm focus:outline-none focus:ring-2 focus:ring-lime-500 dark:bg-white-800 dark:border-gray-600 dark:text-white">
            </div>
            {{-- Tombol untuk membuka modal --}}
            <button id="openModalBtn" title="Dapatkan Rekomendasi" class="flex-shrink-0 p-2 bg-lime-500 text-white rounded-full shadow-md hover:bg-lime-600">
                <!-- <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6V4m0 16v-2m8-6h2M2 12H4m14.364 7.636l1.414-1.414M2.222 9.778l1.414 1.414m12.728 0l1.414-1.414M3.636 3.636l1.414 1.414M16 12a4 4 0 11-8 0 4 4 0 018 0z"></path>
                </svg> -->
                Input Preferensi
            </button>
        </div>

        <!-- <div class="flex items-center gap-4 mb-4">
            <button class="text-2xl">👤</button>
            <button class="text-2xl">🔖</button>
        </div> -->

        <div id="hasilRekomendasi" class="grid grid-cols-2 sm:grid-cols-4 gap-4 mt-6">
            @foreach ($makanans as $makanan)
            <a href="{{ route('makanan.show', $makanan->id) }}" class="text-center block hover:scale-105 transition">
                <img src="{{ $makanan->gambar }}" alt="{{ $makanan->nama_makanan }}"
                    class="h-28 mx-auto object-cover rounded"
                    onerror="this.onerror=null;this.src='/images/default.jpg';" />
                <p class="font-semibold mt-2">{{ $makanan->nama_makanan }}</p>
                <p class="text-sm text-gray-600">Rp. {{ number_format($makanan->harga, 0, ',', '.') }}</p>
            </a>
            @endforeach
        </div>


        <!-- Modal -->
        <div id="modalPreferensi" class="fixed inset-0 bg-black bg-opacity-40 flex justify-center items-center z-50 hidden">
            <div class="bg-white p-8 rounded-xl shadow-xl max-w-md w-full relative">
                <button id="closeModalBtn" class="absolute top-2 right-2 text-xl font-bold">&times;</button>

                <h3 class="text-xl font-semibold mb-4">Masukkan informasi di bawah</h3>

                <form method="POST" action="" class="space-y-4">
                    @csrf

                    <!-- Budget -->
                    <div>
                        <label class="block text-sm font-medium mb-1">Budget Harian (Rp)</label>
                        <div class="flex items-center gap-2 bg-lime-500 text-white px-4 py-2 rounded">
                            <!-- <img src="https://img.icons8.com/ios-filled/24/money-bag.png" /> -->
                            <img src="https://img.icons8.com/ios/50/us-dollar-circled--v2.png" alt="us-dollar-circled--v2" class="w-8 h-8 flex-shrink-0" />
                            <input type="number" name="budget" class="w-full bg-transparent border-none text-white focus:ring-0 placeholder-white" placeholder="Masukkan budget..." required>
                        </div>
                    </div>

                    <!-- Diet -->
                    <div>
                        <label class="block text-sm font-medium mb-1">Preferensi Diet</label>
                        <div class="flex items-center gap-2 bg-lime-500 text-white px-4 py-2 rounded">
                            <img src="https://img.icons8.com/ios/50/healthy-eating.png" alt="healthy-eating" class="w-8 h-8 flex-shrink-0" />
                            <select name="diet" class="bg-lime-500 border-none text-white focus:ring-0 w-full" required>
                                <option value="">-- Pilih Tipe Diet --</option>
                                <option value="Anything">Bebas</option>
                                <option value="Keto">Keto</option>
                                <option value="Vegetarian">Vegetarian</option>
                                <option value="Vegan">Vegan</option>
                            </select>
                        </div>
                    </div>

                    <button type="submit" class="w-full bg-lime-500 text-white py-2 rounded hover:bg-lime-600">
                        Lihat Rekomendasi
                    </button>
                </form>
            </div>
        </div>


    </div>

    <!-- Modal Script -->
    <script>
        const openModal = document.getElementById('openModalBtn');
        const closeModal = document.getElementById('closeModalBtn');
        const modal = document.getElementById('modalPreferensi');

        openModal.addEventListener('click', () => modal.classList.remove('hidden'));
        closeModal.addEventListener('click', () => modal.classList.add('hidden'));

        // Tampilkan modal jika datang dari tombol "Mulai Rekomendasi"
        @if(request('showModal') === 'true')
        window.addEventListener('DOMContentLoaded', () => modal.classList.remove('hidden'));
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
                    modal.classList.add('hidden');

                    let html = '';
                    let hasil = data.rekomendasi.length ? data.rekomendasi : data.saran;

                    if (data.message) {
                        html += `<div class="col-span-full text-yellow-600 font-semibold">${data.message}</div>`;
                    }

                    hasil.forEach(item => {
                        const nama = item["Nama Makanan"];
                        const harga = item["Harga (Rp)"];
                        const diet = item["Tipe Diet"];
                        const gambar = item["Gambar"] || '/images/default.jpg';

                        html += `
                <div class="text-center">
                    <img src="${gambar}" class="h-28 mx-auto object-cover rounded" onerror="this.onerror=null;this.src='/images/default.jpg';"/>
                    <p class="font-semibold">${nama}</p>
                    <p class="text-gray-600 text-sm">Rp. ${parseInt(harga).toLocaleString()}</p>
                    <p class="text-xs text-gray-500">${diet}</p>
                </div>
            `;
                    });

                    hasilRekomendasi.innerHTML = html || `<div class="col-span-full text-center text-gray-500">Tidak ada hasil ditemukan</div>`;
                })
                .catch(error => {
                    console.error(error);
                    hasilRekomendasi.innerHTML = `<div class="col-span-full text-red-500 text-center">Terjadi kesalahan.</div>`;
                });
        });
    </script>
</x-app-layout>