<x-app-layout>
    <div class="p-6 bg-white">
        <a href="{{ route('rekomendasi') }}" class="text-xl mb-4 inline-block">← Telur Rebus</a>

        <div class="flex flex-col md:flex-row items-center gap-8">
            <img src="{{ asset('images/telur.jpg') }}" class="h-48 object-cover" />

            <div>
                <h2 class="text-lg font-semibold mb-2">Informasi Detail</h2>
                <ul class="space-y-1 text-sm">
                    <li>◉ Kalori: 72</li>
                    <li>◉ Karbohidrat: 0.4g</li>
                    <li>◉ Lemak: 4.8g</li>
                    <li>◉ Protein: 6.3g</li>
                </ul>
                <p class="mt-4 font-semibold">Rp. 5.000</p>

                <button class="mt-2 text-xl">🔖</button>
            </div>
        </div>
    </div>
</x-app-layout>