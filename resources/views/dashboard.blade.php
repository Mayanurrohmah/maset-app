<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
            {{ __('dashboard') }}
        </h2>
    </x-slot>

    <div class="max-w-4xl mx-auto p-10 bg-white rounded">
        <h1 class="text-3xl font-bold mb-4">Hallo {{ Auth::user()->name }} !</h1>
        <p class="text-lg text-gray-800 mb-8">
            Sebelum kamu memilih makanan, yuk pahami dulu jenis-jenis diet berikut.
        </p>

        <div class="space-y-6 text-black">
            <div class="flex items-start gap-4">
                <img src="https://img.icons8.com/color/48/cookie.png" class="w-10 h-10" />
                <div>
                    <p class="font-bold">Bebas/Anything</p>
                    <p class="text-sm">Tidak ada pantangan makanan</p>
                </div>
            </div>

            <div class="flex items-start gap-4">
                <img src="https://img.icons8.com/color/48/milk-bottle.png" class="w-10 h-10" />
                <div>
                    <p class="font-bold">Keto</p>
                    <p class="text-sm">Menghindari karbohidrat tinggi, tepung olahan, dan gula</p>
                </div>
            </div>

            <div class="flex items-start gap-4">
                <img src="https://img.icons8.com/color/48/salad.png" class="w-10 h-10" />
                <div>
                    <p class="font-bold">Vegetarian</p>
                    <p class="text-sm">Tidak mengonsumsi daging, unggas, atau ikan</p>
                </div>
            </div>

            <div class="flex items-start gap-4">
                <img src="https://img.icons8.com/color/48/broccoli.png" class="w-10 h-10" />
                <div>
                    <p class="font-bold">Vegan</p>
                    <p class="text-sm">Tidak mengonsumsi produk hewani termasuk susu dan telur</p>
                </div>
            </div>
        </div>

        <div class="mt-12 text-right">
            <a href="{{ route('makanan.rekomendasi_makanan', ['showModal' => 'true']) }}"
                class="inline-flex items-center bg-lime-500 text-black font-semibold px-6 py-3 rounded-full hover:bg-lime-600 transition">                
                Mulai Rekomendasi
            </a>
        </div>
    </div>
</x-app-layout>