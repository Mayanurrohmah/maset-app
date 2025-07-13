<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-700 dark:text-gray-100 leading-tight">
            Dashboard Admin
        </h2>
    </x-slot>

    <div class="py-10 px-6 max-w-7xl mx-auto space-y-6">

        <!-- Ringkasan -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div class="bg-green-100 dark:bg-green-800 p-6 rounded-xl shadow">
                <div class="text-sm text-gray-600 dark:text-gray-300">Jumlah Pengguna</div>
                <div class="text-3xl font-bold text-green-700 dark:text-white">{{ $jumlahUser }}</div>
            </div>
            <div class="bg-yellow-100 dark:bg-yellow-700 p-6 rounded-xl shadow">
                <div class="text-sm text-gray-600 dark:text-gray-300">Jumlah Makanan</div>
                <div class="text-3xl font-bold text-yellow-700 dark:text-white">{{ $jumlahMakanan }}</div>
            </div>
        </div>

        <!-- Chart -->
        <div class="bg-white dark:bg-gray-800 p-6 rounded-xl shadow">
            <h3 class="text-lg font-semibold text-gray-800 dark:text-gray-200 mb-4">Makanan per Diet</h3>
            <canvas id="dietChart" height="100"></canvas>
        </div>

    </div>

    @push('scripts')
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        const ctx = document.getElementById('dietChart');
        new Chart(ctx, {
            type: 'pie',
            data: {
                labels: {!! json_encode($kategoriLabels) !!},
                datasets: [{
                    label: 'Jumlah Makanan',
                    data: {!! json_encode($kategoriData) !!},
                    backgroundColor: ['#4ade80', '#facc15', '#60a5fa', '#f472b6']
                }]
            }
        });
    </script>
    @endpush
</x-app-layout>
