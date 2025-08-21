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
                <a href="{{ route('makanan.dashboard') }}" class="flex-grow sm:flex-grow-0 bg-red-600 text-white text-center font-bold py-3 px-6 rounded-lg hover:bg-red-700 transition">Dashboard</a>
                <a href="{{ route('makanan.rekomendasi_makanan') }}" class="flex-grow sm:flex-grow-0 bg-blue-600 text-white text-center font-bold py-3 px-6 rounded-lg hover:bg-blue-700 transition">Rekomendasi Makanan</a>
                <a href="{{ route('makanan.kelola_makanan') }}" class="flex-grow sm:flex-grow-0 bg-lime-600 text-white text-center font-bold py-3 px-6 rounded-lg hover:bg-lime-700 transition">Kelola Makanan</a>
                <a href="{{ route('auth.user_pengguna') }}" class="flex-grow sm:flex-grow-0 bg-gray-700 text-white text-center font-bold py-3 px-6 rounded-lg hover:bg-gray-800 transition">Data Pengguna</a>
                <a href="{{ route('makanan.favorit') }}" class="flex-grow sm:flex-grow-0 bg-indigo-600 text-white text-center font-bold py-3 px-6 rounded-lg hover:bg-indigo-700 transition">Makanan Favorit</a>
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
                    <h2 class="text-lg font-semibold mb-2">Top 5 Makanan Favorit</h2>
                    <div id="topFoodsChart"></div>
                </div>
            </div>

            {{-- Grafik & Tabel Kanan --}}
            <div class="lg:col-span-1 space-y-8">
                {{-- Donut Chart Diet --}}
                <div class="bg-white p-6 rounded-xl shadow-xl">
                    <div id="dietChart"></div>
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
                            <!-- <a href="#" class="text-sm text-blue-600 hover:underline">Detail</a> -->
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
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // User Registration Chart
            fetch('{{ route("admin.chartData") }}?type=user')
                .then(response => response.json())
                .then(data => {
                    const options = {
                        chart: {
                            type: 'line',
                            height: 350
                        },
                        series: [{
                            name: 'User Baru',
                            data: data.data.map(Number),
                        }],
                        xaxis: {
                            categories: data.labels
                        },
                        tooltip: {
                            y: {
                                formatter: val => val + " user"
                            }
                        },
                        title: {
                            text: 'Pendaftaran User (7 Hari Terakhir)'
                        }
                    };
                    new ApexCharts(document.querySelector("#userChart"), options).render();
                });

            // Diet Distribution Chart
            fetch('{{ route("admin.chartData") }}?type=diet')
                .then(response => response.json())
                .then(data => {
                    const options = {
                        chart: {
                            type: 'pie',
                            height: 350
                        },
                        series: data.data.map(Number),
                        labels: data.labels,
                        legend: {
                            position: 'bottom'
                        },
                        title: {
                            text: 'Distribusi Tipe Diet'
                        }
                    };
                    new ApexCharts(document.querySelector("#dietChart"), options).render();
                });

            // Top Foods Chart
            fetch('{{ route("admin.chartData") }}?type=top_foods')
                .then(response => response.json())
                .then(data => {
                    const options = {
                        chart: {
                            type: 'bar',
                            height: 350
                        },
                        series: [{
                            name: 'Difavoritkan',
                            data: data.data.map(Number)
                        }],
                        xaxis: {
                            categories: data.labels
                        },
                        tooltip: {
                            y: {
                                formatter: function(val, opts) {
                                    let labelName = opts.w.globals.labels[opts.dataPointIndex];
                                    return `${val} kali - ${labelName}`;
                                }
                            }
                        },
                        title: {
                            text: '5 Makanan Paling Disukai'
                        }
                    };
                    new ApexCharts(document.querySelector("#topFoodsChart"), options).render();
                });
        });
    </script>

    @endpush
</x-app-layout>