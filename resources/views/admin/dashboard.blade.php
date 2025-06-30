<x-app-layout>
    <div class="grid grid-cols-3 gap-4 mb-8">
        <div class="bg-lime-400 text-white p-4 rounded shadow flex items-center space-x-4">
            <span class="text-3xl">👤</span>
            <div>
                <div class="font-bold">Total Pengguna</div>
                <div>50</div>
            </div>
        </div>
        <div class="bg-lime-400 text-white p-4 rounded shadow flex items-center space-x-4">
            <span class="text-3xl">🍽️</span>
            <div>
                <div class="font-bold">Data Makanan</div>
                <div>1000</div>
            </div>
        </div>
        <div class="bg-lime-400 text-white p-4 rounded shadow flex items-center space-x-4">
            <span class="text-3xl">📊</span>
            <div>
                <div class="font-bold">Aktivitas Pengguna</div>
                <div>10</div>
            </div>
        </div>
    </div>

    <div class="flex justify-center">
        <img src="{{ asset('images/chart.png') }}" alt="Chart" class="w-1/2">
    </div>
</x-app-layout>