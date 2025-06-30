<x-app-layout>
    <div class="p-6 bg-white">
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
    </div>
</x-app-layout>