<x-app-layout>
    <div class="min-h-[85vh] bg-gradient-to-br from-lime-100 via-emerald-100 to-lime-200 pt-20 pb-10">
        <div class="max-w-6xl mx-auto px-6">
            <div class="bg-white/80 backdrop-blur-md rounded-3xl p-8 shadow-lg">
                <h1 class="text-2xl font-bold text-gray-800 mb-3">Hallo {{ Auth::user()->name }} 👋</h1>
                <p class="text-base text-gray-700 mb-6">Pahami dulu jenis-jenis diet berikut ini agar rekomendasi lebih sesuai:</p>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                    <!-- Card: Bebas -->
                    <div class="bg-yellow-200 p-4 rounded-xl shadow hover:scale-105 transition">
                        <div class="flex gap-3 items-start">
                            <img src="https://img.icons8.com/color/48/cookie.png" class="w-10 h-10" />
                            <div>
                                <p class="font-semibold text-gray-800">Bebas / Anything</p>
                                <p class="text-sm text-gray-600">Tanpa pantangan makanan. Cocok untuk fleksibel memilih menu.</p>
                            </div>
                        </div>
                    </div>
                    <!-- Card: Keto -->
                    <div class="bg-blue-200 p-4 rounded-xl shadow hover:scale-105 transition">
                        <div class="flex gap-3 items-start">
                            <img src="https://img.icons8.com/color/48/milk-bottle.png" class="w-10 h-10" />
                            <div>
                                <p class="font-semibold text-gray-800">Keto</p>
                                <p class="text-sm text-gray-600">Tinggi lemak & protein, rendah karbohidrat dan gula.</p>
                            </div>
                        </div>
                    </div>
                    <!-- Card: Vegetarian -->
                    <div class="bg-green-200 p-4 rounded-xl shadow hover:scale-105 transition">
                        <div class="flex gap-3 items-start">
                            <img src="https://img.icons8.com/color/48/salad.png" class="w-10 h-10" />
                            <div>
                                <p class="font-semibold text-gray-800">Vegetarian</p>
                                <p class="text-sm text-gray-600">Tanpa daging & ikan, tapi masih konsumsi telur/susu.</p>
                            </div>
                        </div>
                    </div>
                    <!-- Card: Vegan -->
                    <div class="bg-pink-200 p-4 rounded-xl shadow hover:scale-105 transition">
                        <div class="flex gap-3 items-start">
                            <img src="https://img.icons8.com/color/48/broccoli.png" class="w-10 h-10" />
                            <div>
                                <p class="font-semibold text-gray-800">Vegan</p>
                                <p class="text-sm text-gray-600">100% nabati, tidak konsumsi produk hewani sama sekali.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Tombol -->
                <div class="text-center">
                    <a href="{{ route('makanan.rekomendasi_makanan', ['showModal' => 'true']) }}"
                        class="inline-flex items-center gap-2 px-6 py-3 bg-gradient-to-r from-lime-500 to-emerald-500 text-white font-semibold rounded-full shadow-md hover:scale-105 hover:shadow-xl transition-all">
                        <i class="fas fa-play animate-pulse"></i> Mulai Rekomendasi
                    </a>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
