<x-app-layout>
    <div class="p-6 bg-white max-w-4xl mx-auto rounded-lg shadow-md">
        <h1 class="text-2xl font-bold mb-6 text-gray-800">Tambah Data Makanan</h1>
        <form action="{{ route('makanan.store') }}" method="POST">
            @csrf

            {{-- Menggunakan struktur grid dari contoh Flowbite --}}
            <div class="grid gap-6 mb-6 md:grid-cols-2">
                {{-- Kolom 1: Nama Makanan --}}
                <div>
                    <label for="nama_makanan" class="block mb-2 text-sm font-medium text-gray-900">Nama Makanan</label>
                    <input type="text" id="nama_makanan" name="nama_makanan" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-lime-500 focus:border-lime-500 block w-full p-2.5" placeholder="Contoh: Salad Ayam" required>
                </div>

                {{-- Kolom 2: Link Gambar --}}
                <div>
                    <label for="gambar" class="block mb-2 text-sm font-medium text-gray-900">Link Gambar</label>
                    <input type="url" id="gambar" name="gambar" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-lime-500 focus:border-lime-500 block w-full p-2.5" placeholder="https://example.com/gambar.jpg">
                </div>

                {{-- Kolom 1: Kalori --}}
                <div>
                    <label for="kalori" class="block mb-2 text-sm font-medium text-gray-900">Kalori (kcal)</label>
                    <input type="number" id="kalori" name="kalori" step="0.01" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-lime-500 focus:border-lime-500 block w-full p-2.5" placeholder="350" required>
                </div>

                {{-- Kolom 2: Karbohidrat --}}
                <div>
                    <label for="karbohidrat" class="block mb-2 text-sm font-medium text-gray-900">Karbohidrat (g)</label>
                    <input type="number" id="karbohidrat" name="karbohidrat" step="0.01" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-lime-500 focus:border-lime-500 block w-full p-2.5" placeholder="10.5" required>
                </div>

                {{-- Kolom 1: Protein --}}
                <div>
                    <label for="protein" class="block mb-2 text-sm font-medium text-gray-900">Protein (g)</label>
                    <input type="number" id="protein" name="protein" step="0.01" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-lime-500 focus:border-lime-500 block w-full p-2.5" placeholder="30.2" required>
                </div>

                {{-- Kolom 2: Harga --}}
                <div>
                    <label for="harga" class="block mb-2 text-sm font-medium text-gray-900">Harga (Rp)</label>
                    <input type="number" id="harga" name="harga" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-lime-500 focus:border-lime-500 block w-full p-2.5" placeholder="50000" required>
                </div>
            </div>

            {{-- Tipe Diet (Satu Kolom Penuh) --}}
            <div class="mb-6">
                <label for="tipe_diet" class="block mb-2 text-sm font-medium text-gray-900">Tipe Diet</label>
                <select id="tipe_diet" name="tipe_diet" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-lime-500 focus:border-lime-500 block w-full p-2.5" required>
                    <option value="" selected>Pilih Tipe Diet</option>
                    <option value="Keto">Keto</option>
                    <option value="Vegetarian">Vegetarian</option>
                    <option value="Vegan">Vegan</option>
                    <option value="Normal">Normal</option>
                </select>
            </div>

            {{-- Tombol Simpan --}}
            <div class="flex justify-end">
                <button type="submit" class="text-white bg-lime-500 hover:bg-lime-600 focus:ring-4 focus:outline-none focus:ring-lime-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center">Simpan Data</button>
            </div>
        </form>
    </div>
</x-app-layout>