{{-- resources/views/dashboard.blade.php --}}
<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            Dashboard Admin
        </h2>
    </x-slot>

    <div class="py-10 px-6 max-w-7xl mx-auto space-y-6">
        {{-- Kartu Statistik Utama --}}
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
            {{-- Jumlah Pengguna --}}
            <a href="#" class="bg-white p-6 rounded-2xl shadow-xl hover:shadow-2xl transition block" aria-label="Jumlah Pengguna">
                <div class="flex items-center justify-between">
                    <p class="text-sm font-semibold uppercase text-gray-600">Jumlah Pengguna</p>
                    <i class="fas fa-users text-green-500 text-xl"></i>
                </div>
                <h3 class="text-3xl font-bold text-green-700 mt-2">{{ $jumlahUser ?? 0 }}</h3>
            </a>

            {{-- Jumlah Makanan --}}
            <a href="#" class="bg-white p-6 rounded-2xl shadow-xl hover:shadow-2xl transition block" aria-label="Jumlah Makanan">
                <div class="flex items-center justify-between">
                    <p class="text-sm font-semibold uppercase text-gray-600">Jumlah Makanan</p>
                    <i class="fas fa-utensils text-yellow-500 text-xl"></i>
                </div>
                <h3 class="text-3xl font-bold text-yellow-600 mt-2">{{ $jumlahMakanan ?? 0 }}</h3>
            </a>

            {{-- Makanan Paling Favorit --}}
            <a href="#" class="bg-white p-6 rounded-2xl shadow-xl hover:shadow-2xl transition block" aria-label="Makanan Paling Favorit">
                <div class="flex items-center justify-between">
                    <p class="text-sm font-semibold uppercase text-gray-600">Paling Favorit</p>
                    <i class="fas fa-heart text-pink-500 text-xl"></i>
                </div>
                <h3 class="text-lg font-bold text-pink-500 mt-2 truncate">{{ $palingFavorit->nama_makanan ?? 'N/A' }}</h3>
            </a>

            {{-- Pengguna Aktif --}}
            <div class="bg-white p-6 rounded-2xl shadow-xl block">
                <div class="flex items-center justify-between">
                    <p class="text-sm font-semibold uppercase text-gray-600">Pengguna Aktif Hari Ini</p>
                    <i class="fas fa-bolt text-purple-500 text-xl"></i>
                </div>
                <h3 class="text-3xl font-bold text-purple-500 mt-2">{{ $penggunaAktif ?? 0 }}</h3>
            </div>
        </div>

        {{-- Menu Akses Cepat --}}
        <div class="bg-white p-4 rounded-2xl shadow-xl">
            <div class="flex flex-wrap justify-center items-center gap-4">
                <a href="#" class="flex-grow sm:flex-grow-0 bg-lime-600 text-white text-center font-bold py-3 px-6 rounded-lg hover:bg-lime-700 transition">Kelola Makanan</a>
                <a href="#" class="flex-grow sm:flex-grow-0 bg-blue-600 text-white text-center font-bold py-3 px-6 rounded-lg hover:bg-blue-700 transition">Kelola Pengguna</a>
                <a href="#" class="flex-grow sm:flex-grow-0 bg-gray-700 text-white text-center font-bold py-3 px-6 rounded-lg hover:bg-gray-800 transition">Lihat Laporan</a>
                <a href="#" class="flex-grow sm:flex-grow-0 bg-indigo-600 text-white text-center font-bold py-3 px-6 rounded-lg hover:bg-indigo-700 transition">Pengaturan</a>
            </div>
        </div>

        {{-- Bagian Grafik & Tabel --}}
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8 mt-8">
            {{-- Grafik Kiri --}}
            <div class="lg:col-span-2 space-y-8">
                {{-- Grafik Pengguna Baru --}}
                <div class="bg-white p-6 rounded-xl shadow-xl">
                    <h3 class="text-lg font-semibold text-gray-800 mb-4">Pendaftaran Pengguna Baru (7 Hari Terakhir)</h3>
                    <div id="userChart"></div>
                </div>

                {{-- Grafik Makanan Terfavorit --}}
                <div class="bg-white p-6 rounded-xl shadow-xl">
                    <h3 class="text-lg font-semibold text-gray-800 mb-4">5 Makanan Terfavorit</h3>
                    <div id="topFoodsChart"></div>
                </div>
            </div>

            {{-- Grafik & Tabel Kanan --}}
            <div class="lg:col-span-1 space-y-8">
                {{-- Donut Chart Diet --}}
                <div class="bg-white p-6 rounded-xl shadow-xl">
                    <h3 class="text-lg font-semibold text-gray-800 mb-4">Distribusi Tipe Diet</h3>
                    <div id="dietChart" class="flex justify-center"></div>
                </div>

                {{-- Tabel Pengguna Terbaru --}}
                <div class="bg-white p-6 rounded-xl shadow-xl">
                    <h3 class="text-lg font-semibold text-gray-800 mb-4">Pengguna Terbaru</h3>
                    <ul class="space-y-4">
                        @forelse ($penggunaTerbaru as $user)
                        <li class="flex items-center justify-between">
                            <div>
                                <p class="font-semibold text-gray-800">{{ $user->name }}</p>
                                <p class="text-sm text-gray-500">{{ $user->email }}</p>
                            </div>
                            <a href="#" class="text-sm text-blue-600 hover:underline">Detail</a>
                        </li>
                        @empty
                        <li>
                            <p class="text-sm text-gray-500">Tidak ada pengguna baru.</p>
                        </li>
                        @endforelse
                    </ul>
                </div>
            </div>
        </div>
    </div>

    @push('scripts')
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
     <script>
            // Data sekarang diambil dari controller Laravel
            const userLabels = {!! json_encode($userLabels ?? []) !!};
            const userData = {!! json_encode($userData ?? []) !!};
            
            const dietLabels = {!! json_encode($dietLabels ?? []) !!};
            const dietData = {!! json_encode($dietData ?? []) !!};

            // const topFoodsLabels = {!! json_encode($topFoodsLabels ?? []) !!};
            const topFoodsData = {!! json_encode($topFoodsData ?? []) !!};

            // --- Grafik Pendaftaran Pengguna Baru (Area Chart) ---
            const userChartOptions = {
                series: [{ name: "Pengguna Baru", data: userData }],
                chart: { type: 'area', height: 350, toolbar: { show: false } },
                dataLabels: { enabled: false },
                stroke: { curve: 'smooth', width: 2 },
                xaxis: { type: 'category', categories: userLabels },
                colors: ['#16a34a'],
                tooltip: {
                    enabled: true,
                    y: {
                        formatter: function(val) {
                            return val + " pengguna";
                        }
                    }
                },
            };
            const userChart = new ApexCharts(document.querySelector("#userChart"), userChartOptions);
            userChart.render();

            // --- Grafik Distribusi Tipe Diet (Donut Chart) ---
            const dietChartOptions = {
                series: dietData,
                chart: { type: 'donut', height: 350 },
                labels: dietLabels,
                colors: ['#4ade80', '#facc15', '#60a5fa', '#a78bfa'],
                legend: { position: 'bottom' },
                tooltip: {
                    enabled: true,
                    y: {
                        formatter: function (val) {
                            return val + " item"
                        }
                    },
                },
                responsive: [{ breakpoint: 480, options: { chart: { width: 200 }, legend: { position: 'bottom' } } }]
            };
            const dietChart = new ApexCharts(document.querySelector("#dietChart"), dietChartOptions);
            dietChart.render();

            // --- Grafik Makanan Terfavorit (Horizontal Bar dengan struktur x-y) ---
            const topFoodsChartOptions = {
                series: [{
                    name: 'Jumlah Favorit',
                    data: topFoodsData
                }],
                chart: {
                    type: 'bar',
                    height: 350,
                    toolbar: { show: false }
                },
                plotOptions: {
                    bar: {
                        horizontal: true,
                        borderRadius: 4
                    }
                },
                dataLabels: {
                    enabled: false
                },
                colors: ['#fb923c'],
                grid: {
                    show: false
                },
                tooltip: {
                    enabled: true,
                    y: {
                        formatter: function (val) {
                            return val + ' favorit';
                        }
                    },
                    marker: {
                        show: true
                    }
                }
            };

            const topFoodsChart = new ApexCharts(document.querySelector("#topFoodsChart"), topFoodsChartOptions);
            topFoodsChart.render();


        </script>
    @endpush
</x-app-layout>