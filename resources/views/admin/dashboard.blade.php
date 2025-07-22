<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-700 dark:text-white leading-tight">
            Dashboard Admin
        </h2>
    </x-slot>

    <div class="py-10 px-6 max-w-7xl mx-auto space-y-6">
        <!-- Summary Cards -->
        <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
            <!-- Pengguna -->
            <a href="{{ route('auth.user_pengguna') }}" class="bg-white dark:bg-slate-850 p-6 rounded-2xl shadow-xl hover:shadow-2xl transition duration-200 block">
                <div class="flex items-center justify-between">
                    <p class="text-sm font-semibold uppercase text-gray-600 dark:text-white/60">Jumlah Pengguna</p>
                    <i class="fas fa-users text-green-500 text-xl"></i>
                </div>
                <h3 class="text-3xl font-bold text-green-700 dark:text-white mt-2">{{ $jumlahUser ?? 0 }}</h3>
            </a>

            <!-- Makanan -->
            <a href="{{ route('makanan.kelola_makanan') }}" class="bg-white dark:bg-slate-850 p-6 rounded-2xl shadow-xl hover:shadow-2xl transition duration-200 block">
                <div class="flex items-center justify-between">
                    <p class="text-sm font-semibold uppercase text-gray-600 dark:text-white/60">Jumlah Makanan</p>
                    <i class="fas fa-utensils text-yellow-500 text-xl"></i>
                </div>
                <h3 class="text-3xl font-bold text-yellow-600 dark:text-yellow-300 mt-2">{{ $jumlahMakanan ?? 0 }}</h3>
            </a>

            <!-- Favorit -->
            <a href="{{ route('makanan.favorit') }}" class="bg-white dark:bg-slate-850 p-6 rounded-2xl shadow-xl hover:shadow-2xl transition duration-200 block">
                <div class="flex items-center justify-between">
                    <p class="text-sm font-semibold uppercase text-gray-600 dark:text-white/60">Makanan Difavoritkan</p>
                    <i class="fas fa-heart text-pink-500 text-xl"></i>
                </div>
                <h3 class="text-3xl font-bold text-pink-500 dark:text-pink-300 mt-2">{{ $jumlahFavorit ?? 0 }}</h3>
            </a>

            <!-- Tipe Diet -->
            <div class="bg-white dark:bg-slate-850 p-6 rounded-2xl shadow-xl block">
                <div class="flex items-center justify-between">
                    <p class="text-sm font-semibold uppercase text-gray-600 dark:text-white/60">Tipe Diet</p>
                    <i class="fas fa-apple-alt text-purple-500 text-xl"></i>
                </div>
                <h3 class="text-3xl font-bold text-purple-500 dark:text-purple-300 mt-2">{{ count($kategoriLabels) ?? 0 }}</h3>
            </div>
        </div>

        <!-- Grafik Line: Makanan difavoritkan tiap minggu -->
        <div class="bg-white dark:bg-gray-800 p-6 rounded-xl shadow mt-8">
            <h3 class="text-lg font-semibold text-gray-800 dark:text-gray-200 mb-4">Makanan Difavoritkan Tiap Minggu</h3>
            <canvas id="favoriteChart" height="100"></canvas>
        </div>

        <!-- Pie Chart -->
        <div class="bg-white dark:bg-gray-800 p-6 rounded-xl shadow mt-8">
            <h3 class="text-lg font-semibold text-gray-800 dark:text-gray-200 mb-4">Distribusi Tipe Diet</h3>
            <canvas id="dietChart" height="100"></canvas>
        </div>
    </div>

    @push('scripts')
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
            // Pie Chart - Tipe Diet
            const ctxDiet = document.getElementById('dietChart');
            new Chart(ctxDiet, {
                type: 'pie',
                data: {
                    labels: {!! json_encode($kategoriLabels ?? []) !!},
                    datasets: [{
                        data: {!! json_encode($kategoriData ?? []) !!},
                        backgroundColor: ['#4ade80', '#facc15', '#60a5fa', '#f472b6', '#a78bfa', '#f87171'],
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'bottom'
                        }
                    }
                }
            });

            // Line Chart - Favorit Mingguan
            const ctxFavorite = document.getElementById('favoriteChart');
            new Chart(ctxFavorite, {
                type: 'line',
                data: {
                    labels: {!! json_encode($mingguLabels ?? []) !!},
                    datasets: [{
                        label: 'Jumlah Favorit',
                        data: {!! json_encode($favoritMingguan ?? []) !!},
                        borderColor: '#3b82f6',
                        backgroundColor: 'rgba(59, 130, 246, 0.2)',
                        fill: true,
                        tension: 0.4
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            display: false
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        </script>
    @endpush
</x-app-layout>
