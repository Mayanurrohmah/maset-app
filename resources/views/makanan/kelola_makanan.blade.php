<x-app-layout>
    <div class="p-4 sm:p-6 bg-white min-h-screen">
        @if(session('success'))
        {{-- Notifikasi Sukses dari Flowbite --}}
        <div id="alert-3" class="flex items-center p-4 mb-4 text-green-800 rounded-lg bg-green-50" role="alert">
            <svg class="flex-shrink-0 w-4 h-4" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z" />
            </svg>
            <span class="sr-only">Info</span>
            <div class="ms-3 text-sm font-medium">
                {{ session('success') }}
            </div>
            <button type="button" class="ms-auto -mx-1.5 -my-1.5 bg-green-50 text-green-500 rounded-lg focus:ring-2 focus:ring-green-400 p-1.5 hover:bg-green-200 inline-flex items-center justify-center h-8 w-8" data-dismiss-target="#alert-3" aria-label="Close">
                <span class="sr-only">Close</span>
                <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
                </svg>
            </button>
        </div>
        @endif

        {{-- Container Utama Flowbite untuk Tabel --}}
        <div class="relative overflow-x-auto shadow-md sm:rounded-lg bg-white p-4">
            <h1 class="text-2xl font-bold mb-4 text-gray-800">Kelola Data Makanan</h1>

            {{-- PERBAIKAN: Header Tabel dibuat responsif dengan flex-wrap --}}
            <div class="flex flex-wrap items-center justify-between space-y-4 md:space-y-0 pb-4">
                {{-- Tombol Aksi di Kiri --}}
                <div class="flex gap-2">
                    <a href="{{ route('makanan.create') }}" class="inline-flex items-center justify-center text-white bg-lime-600 hover:bg-lime-700 focus:ring-4 focus:ring-lime-300 font-medium rounded-lg text-sm px-4 py-2">
                        <i class="fas fa-plus mr-2"></i>
                        Tambah
                    </a>
                    <button data-modal-target="importModal" data-modal-toggle="importModal" type="button" class="inline-flex items-center justify-center text-white bg-blue-600 hover:bg-blue-700 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2">
                        <i class="fas fa-file-import mr-2"></i>
                        Import
                    </button>
                </div>

                {{-- Pencarian dan Filter di Kanan --}}
                <div class="flex flex-col sm:flex-row items-center gap-2 w-full sm:w-auto">
                    {{-- Dropdown Filter --}}
                    <div>
                        <button id="dropdownRadioButton" data-dropdown-toggle="dropdownRadio" class="w-full sm:w-auto inline-flex items-center text-gray-500 bg-white border border-gray-300 focus:outline-none hover:bg-gray-100 focus:ring-4 focus:ring-gray-100 font-medium rounded-lg text-sm px-3 py-2" type="button">
                            <i class="fas fa-filter w-3 h-3 text-gray-500 me-3"></i>
                            <span id="filter-label">Filter by Diet</span>
                            <svg class="w-2.5 h-2.5 ms-2.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4" />
                            </svg>
                        </button>
                        <div id="dropdownRadio" class="z-10 hidden w-48 bg-white divide-y divide-gray-100 rounded-lg shadow">
                            <ul class="p-3 space-y-1 text-sm text-gray-700" aria-labelledby="dropdownRadioButton">
                                @php
                                $tipe_diets = ['Semua', 'Keto', 'Vegetarian', 'Vegan', 'Normal'];
                                $current_filter = request('tipe_diet');
                                @endphp
                                @foreach($tipe_diets as $diet)
                                <li>
                                    <div class="flex items-center p-2 rounded hover:bg-gray-100">
                                        <input id="filter-radio-{{ strtolower($diet) }}" type="radio" value="{{ $diet === 'Semua' ? '' : $diet }}" name="filter-radio" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 focus:ring-2" {{ ($current_filter == $diet || (empty($current_filter) && $diet == 'Semua')) ? 'checked' : '' }}>
                                        <label for="filter-radio-{{ strtolower($diet) }}" class="w-full ms-2 text-sm font-medium text-gray-900 rounded">{{ $diet }}</label>
                                    </div>
                                </li>
                                @endforeach
                            </ul>
                        </div>
                    </div>
                    {{-- Input Pencarian --}}
                    <div class="relative w-full sm:w-auto">
                        <div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
                            <i class="fas fa-search text-gray-500"></i>
                        </div>
                        <input type="text" id="table-search-makanan" class="block p-2 ps-10 text-sm text-gray-900 border border-gray-300 rounded-lg w-full sm:w-80 bg-gray-50 focus:ring-blue-500 focus:border-blue-500" placeholder="Cari makanan" value="{{ request('search') }}">
                    </div>
                </div>
            </div>

            {{-- Tabel Data --}}
            <table class="w-full text-sm text-left rtl:text-right text-gray-500">
                <thead class="text-xs text-gray-700 uppercase bg-gray-50">
                    <tr>
                        <th scope="col" class="p-4">No</th>
                        <th scope="col" class="px-16 py-3">
                            <span class="sr-only">Image</span>
                        </th>
                        <th scope="col" class="px-6 py-3">Nama Makanan</th>
                        <th scope="col" class="px-6 py-3">Protein</th>
                        <th scope="col" class="px-6 py-3">Karbo</th>
                        <th scope="col" class="px-6 py-3">Kalori</th>
                        <th scope="col" class="px-6 py-3">Harga</th>
                        <th scope="col" class="px-6 py-3">Tipe Diet</th>
                        <th scope="col" class="px-6 py-3">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($makanans as $index => $makanan)
                    <tr class="bg-white border-b hover:bg-gray-50">
                        <td class="w-4 p-4">{{ $makanans->firstItem() + $index }}</td>
                        <td class="p-4">
                            <img class="w-16 md:w-32 max-w-full max-h-full" src="{{ $makanan->gambar }}" alt="{{ $makanan->nama_makanan }}" onerror="this.src='/images/default.jpg'">
                        </td>
                        <!-- <th scope="row" class="flex items-center px-6 py-4 text-gray-900 whitespace-nowrap">

                            <div class="ps-3">
                                <div class="text-base font-semibold">{{ $makanan->nama_makanan }}</div>
                                <div class="font-normal text-gray-500">Protein: {{ $makanan->protein }}g | Karbo: {{ $makanan->karbohidrat }}g</div>
                            </div>
                        </th> -->
                        <td class="px-6 py-4">{{ $makanan->nama_makanan }}</td>
                        <td class="px-6 py-4">{{ $makanan->protein }} kcal</td>
                        <td class="px-6 py-4">{{ $makanan->karbohidrat }} kcal</td>
                        <td class="px-6 py-4">{{ $makanan->kalori }} kcal</td>
                        <td class="px-6 py-4">Rp. {{ number_format($makanan->harga, 0, ',', '.') }}</td>
                        <td class="px-6 py-4">
                            <span class="bg-lime-100 text-lime-800 text-xs font-medium me-2 px-2.5 py-0.5 rounded">{{ $makanan->tipe_diet }}</span>
                        </td>
                        <td class="px-6 py-4 flex items-center gap-2">
                            <a href="{{ route('makanan.edit', $makanan) }}" class="font-medium text-blue-600 hover:underline">Edit</a>
                            <form action="{{ route('makanan.destroy', $makanan->id) }}" method="POST" onsubmit="return confirm('Anda yakin ingin menghapus data ini?')">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="font-medium text-red-600 hover:underline">Hapus</button>
                            </form>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="6" class="text-center py-10 text-gray-500">
                            Tidak ada data makanan yang ditemukan.
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        {{-- Paginasi --}}
        <nav class="flex items-center justify-between pt-4" aria-label="Table navigation">
            {{ $makanans->appends(request()->query())->links() }}
        </nav>
    </div>

    {{-- Modal untuk Impor CSV --}}
    <div id="importModal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-modal md:h-full">
        <div class="relative p-4 w-full max-w-md h-full md:h-auto">
            <div class="relative p-4 text-center bg-white rounded-lg shadow sm:p-5">
                <button type="button" data-modal-hide="importModal" class="text-gray-400 absolute top-2.5 right-2.5 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center">
                    <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                    </svg>
                    <span class="sr-only">Close modal</span>
                </button>
                <i class="fas fa-file-csv text-gray-400 w-11 h-11 mb-3.5 mx-auto text-5xl"></i>
                <p class="mb-4 text-gray-500">Import data makanan dari file CSV.</p>
                <form action="{{ route('makanan.import.store') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <div class="mb-4">
                        <input type="file" name="file" required class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 focus:outline-none">
                    </div>
                    <button type="submit" class="w-full text-white bg-blue-600 hover:bg-blue-700 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5">
                        Import Sekarang
                    </button>
                </form>
            </div>
        </div>
    </div>

    {{-- PERBAIKAN: Skrip dipindahkan ke dalam @push('scripts') agar di-load setelah layout utama --}}
    @push('scripts')
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Skrip untuk Filter dan Pencarian
            const radioFilters = document.querySelectorAll('input[name="filter-radio"]');
            const searchInput = document.getElementById('table-search-makanan');
            const filterLabel = document.getElementById('filter-label');

            function applyFilters() {
                const currentUrl = new URL(window.location.href);
                const selectedDiet = document.querySelector('input[name="filter-radio"]:checked').value;
                const searchQuery = searchInput.value;

                // Set parameter URL
                if (selectedDiet) {
                    currentUrl.searchParams.set('tipe_diet', selectedDiet);
                } else {
                    currentUrl.searchParams.delete('tipe_diet');
                }

                if (searchQuery) {
                    currentUrl.searchParams.set('search', searchQuery);
                } else {
                    currentUrl.searchParams.delete('search');
                }

                // Pindah ke URL baru
                window.location.href = currentUrl.toString();
            }

            radioFilters.forEach(radio => {
                radio.addEventListener('change', applyFilters);
            });

            if (searchInput) {
                searchInput.addEventListener('keyup', function(event) {
                    if (event.key === 'Enter') {
                        applyFilters();
                    }
                });
            }

            // Update label filter saat halaman dimuat
            const currentFilterRadio = document.querySelector('input[name="filter-radio"]:checked');
            if (currentFilterRadio && currentFilterRadio.value) {
                filterLabel.textContent = currentFilterRadio.labels[0].textContent;
            } else {
                filterLabel.textContent = 'Semua Diet';
            }
        });
    </script>
    @endpush
    </div>
</x-app-layout>