<x-app-layout>
    <div class="p-6 bg-white">
        <h2 class="text-xl font-semibold mb-4">Favorite Food</h2>

        <input type="text" placeholder="Cari..." class="w-full max-w-sm mb-6 px-4 py-2 border rounded shadow" />

        <h3 class="text-lg font-semibold mb-3">My Favorite Food</h3>

        <div class="grid grid-cols-2 sm:grid-cols-4 gap-4">
            @foreach ([
            ['img' => 'telur.jpg', 'nama' => 'Telur Rebus', 'harga' => '5000'],
            ['img' => 'salad.jpg', 'nama' => 'Salad Ayam', 'harga' => '15000'],
            ['img' => 'orak.jpg', 'nama' => 'Orak-arik bayam', 'harga' => '10000'],
            ['img' => 'telororak.jpg', 'nama' => 'Telor Orak Arik', 'harga' => '10000'],
            ] as $fav)
            <div class="text-center">
                <img src="{{ asset('images/' . $fav['img']) }}" class="h-28 mx-auto object-cover" />
                <p>{{ $fav['nama'] }}</p>
                <p class="text-sm text-gray-600">Rp. {{ number_format($fav['harga'], 0, ',', '.') }}</p>
            </div>
            @endforeach
        </div>
    </div>
</x-app-layout>