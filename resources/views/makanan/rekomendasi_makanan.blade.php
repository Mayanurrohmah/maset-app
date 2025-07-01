<x-app-layout>
    <div class="p-6 bg-white relative">
        <!-- Tombol Buka Modal -->
        <div class="flex justify-end mb-4">
            <button id="openModalBtn" class="bg-lime-500 text-white px-4 py-2 rounded hover:bg-lime-600">
                Input Preferensi
            </button>
        </div>

        <div class="flex items-center mb-6">
            <button class="text-2xl mr-4">☰</button>
            <input type="text" placeholder="Cari Makanan"
                class="w-full max-w-md px-4 py-2 border rounded-full shadow" />
        </div>

        <div class="flex items-center gap-4 mb-4">
            <button class="text-2xl">👤</button>
            <button class="text-2xl">🔖</button>
        </div>

        <div class="grid grid-cols-2 sm:grid-cols-4 gap-4">
            <!-- Makanan -->
            @foreach ([
            ['img' => 'telur.jpg', 'nama' => 'Telur Rebus', 'harga' => '5000'],
            ['img' => 'salad.jpg', 'nama' => 'Salad Ayam', 'harga' => '15000'],
            ['img' => 'orak.jpg', 'nama' => 'Orak Arik Bayam', 'harga' => '10000'],
            ['img' => 'telororak.jpg', 'nama' => 'Telor Orak Arik', 'harga' => '10000'],
            ] as $makanan)
            <div class="text-center">
                <img src="{{ asset('images/' . $makanan['img']) }}" class="h-28 mx-auto object-cover" />
                <p>{{ $makanan['nama'] }}</p>
                <p class="text-sm text-gray-600">Rp. {{ number_format($makanan['harga'], 0, ',', '.') }}</p>
            </div>
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
                            <img src="https://img.icons8.com/ios-filled/24/money-bag.png" />
                            <input type="number" name="budget" class="w-full bg-transparent border-none text-white focus:ring-0 placeholder-white" placeholder="Masukkan budget..." required>
                        </div>
                    </div>

                    <!-- Diet -->
                    <div>
                        <label class="block text-sm font-medium mb-1">Preferensi Diet</label>
                        <div class="flex items-center gap-2 bg-lime-500 text-white px-4 py-2 rounded">
                            <img src="https://img.icons8.com/ios-filled/24/salad.png" />
                            <select name="diet" class="bg-transparent border-none text-black focus:ring-0 w-full" required>
                                <option value="">-- Pilih Diet --</option>
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
    </script>
</x-app-layout>