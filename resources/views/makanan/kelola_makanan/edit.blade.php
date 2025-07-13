<x-app-layout>
    {{-- Mengubah lebar maksimum agar lebih sesuai untuk 2 kolom --}}
    <div class="p-6 bg-white max-w-4xl mx-auto rounded-lg shadow-md">
        <h1 class="text-2xl font-bold mb-6 text-gray-800">Edit Data Makanan</h1>
        
        {{-- Arahkan form ke route update dengan method PUT --}}
        <form action="{{ route('makanan.update', $makanan->id) }}" method="POST">
            @csrf
            

            {{-- 
              Container Grid untuk tata letak 2 kolom.
              - `grid`: Mengaktifkan layout grid.
              - `grid-cols-1`: Default menjadi 1 kolom untuk mobile.
              - `md:grid-cols-2`: Menjadi 2 kolom di layar medium (desktop) dan lebih besar.
              - `gap-6`: Memberi jarak antar elemen grid.
            --}}
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

                {{-- Kolom 1 --}}
                <div class="mb-4">
                    <label for="nama_makanan" class="block mb-2 font-medium text-gray-700">Nama Makanan</label>
                    <input type="text" id="nama_makanan" name="nama_makanan" class="w-full border-gray-300 focus:border-lime-500 focus:ring-lime-500 rounded-md shadow-sm" value="{{ $makanan->nama_makanan }}" required>
                </div>

                {{-- Kolom 2 --}}
                <div class="mb-4">
                    <label for="gambar" class="block mb-2 font-medium text-gray-700">Link Gambar</label>
                    <input type="url" id="gambar" name="gambar" class="w-full border-gray-300 focus:border-lime-500 focus:ring-lime-500 rounded-md shadow-sm" value="{{ $makanan->gambar }}">
                </div>

                {{-- Kolom 1 --}}
                <div class="mb-4">
                    <label for="kalori" class="block mb-2 font-medium text-gray-700">Kalori</label>
                    <input type="number" id="kalori" name="kalori" step="0.01" class="w-full border-gray-300 focus:border-lime-500 focus:ring-lime-500 rounded-md shadow-sm" value="{{ $makanan->kalori }}" required>
                </div>

                {{-- Kolom 2 --}}
                <div class="mb-4">
                    <label for="karbohidrat" class="block mb-2 font-medium text-gray-700">Karbohidrat</label>
                    <input type="number" id="karbohidrat" name="karbohidrat" step="0.01" class="w-full border-gray-300 focus:border-lime-500 focus:ring-lime-500 rounded-md shadow-sm" value="{{ $makanan->karbohidrat }}" required>
                </div>

                {{-- Kolom 1 --}}
                <div class="mb-4">
                    <label for="protein" class="block mb-2 font-medium text-gray-700">Protein</label>
                    <input type="number" id="protein" name="protein" step="0.01" class="w-full border-gray-300 focus:border-lime-500 focus:ring-lime-500 rounded-md shadow-sm" value="{{ $makanan->protein }}" required>
                </div>

                {{-- Kolom 2 --}}
                <div class="mb-4">
                    <label for="harga" class="block mb-2 font-medium text-gray-700">Harga</label>
                    <input type="number" id="harga" name="harga" class="w-full border-gray-300 focus:border-lime-500 focus:ring-lime-500 rounded-md shadow-sm" value="{{ $makanan->harga }}" required>
                </div>

                {{-- 
                  Elemen ini akan membentang selebar 2 kolom.
                  - `md:col-span-2`: Membuat elemen ini memakan 2 kolom di layar medium (desktop).
                --}}
                <div class="mb-4 md:col-span-2">
                    <label for="tipe_diet" class="block mb-2 font-medium text-gray-700">Tipe Diet</label>
                    <select id="tipe_diet" name="tipe_diet" class="w-full border-gray-300 focus:border-lime-500 focus:ring-lime-500 rounded-md shadow-sm" required>
                        <option value="">-- Pilih Tipe Diet --</option>
                        <option value="Keto" {{ $makanan->tipe_diet == 'Keto' ? 'selected' : '' }}>Keto</option>
                        <option value="Vegetarian" {{ $makanan->tipe_diet == 'Vegetarian' ? 'selected' : '' }}>Vegetarian</option>
                        <option value="Vegan" {{ $makanan->tipe_diet == 'Vegan' ? 'selected' : '' }}>Vegan</option>
                        <option value="Anything" {{ $makanan->tipe_diet == 'Anything' ? 'selected' : '' }}>Bebas</option>
                    </select>
                </div>
            </div>

            {{-- Tombol diletakkan di luar grid untuk penataan yang lebih mudah --}}
            <div class="mt-8 flex justify-end">
                <button type="submit" class="bg-lime-500 text-white px-6 py-2 rounded-md hover:bg-lime-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-lime-500 transition ease-in-out duration-150">
                    Update
                </button>
            </div>
        </form>
    </div>
</x-app-layout>
