<aside id="logo-sidebar" class="fixed top-0 left-0 z-40 w-64 h-screen pt-20 transition-transform -translate-x-full bg-white border-r border-gray-200 sm:translate-x-0" aria-label="Sidebar">
    <div class="h-full px-3 pb-4 overflow-y-auto bg-white">
        <ul class="space-y-2 font-medium">
            {{-- Menu Utama --}}
            <li>
                <a href="{{ route('makanan.dashboard') }}" class="flex items-center p-2 rounded-lg transition duration-200 hover:bg-lime-50 hover:text-lime-700 group {{ request()->routeIs('makanan.dashboard') ? 'bg-lime-100 text-lime-700 font-semibold' : 'text-gray-900' }}">
                    <i class="fas fa-chart-pie w-6 h-6 text-xl transition duration-75 {{ request()->routeIs('makanan.dashboard') ? 'text-lime-700' : 'text-gray-500 group-hover:text-lime-700' }}"></i>
                    <span class="ms-3">Dashboard</span>
                </a>
            </li>
            <li>
                <a href="{{ route('makanan.rekomendasi_makanan') }}" class="flex items-center p-2 rounded-lg transition duration-200 hover:bg-lime-50 hover:text-lime-700 group {{ request()->routeIs('makanan.rekomendasi_makanan') ? 'bg-lime-100 text-lime-700 font-semibold' : 'text-gray-900' }}">
                    <i class="fas fa-utensils w-6 h-6 text-xl transition duration-75 {{ request()->routeIs('makanan.rekomendasi_makanan') ? 'text-lime-700' : 'text-gray-500 group-hover:text-lime-700' }}"></i>
                    <span class="ms-3">Daftar Makanan</span>
                </a>
            </li>
            <li>
                <a href="{{ route('makanan.favorit') }}" class="flex items-center p-2 rounded-lg transition duration-200 hover:bg-lime-50 hover:text-lime-700 group {{ request()->routeIs('makanan.favorit') ? 'bg-lime-100 text-lime-700 font-semibold' : 'text-gray-900' }}">
                    <i class="fas fa-heart w-6 h-6 text-xl transition duration-75 {{ request()->routeIs('makanan.favorit') ? 'text-lime-700' : 'text-gray-500 group-hover:text-lime-700' }}"></i>
                    <span class="ms-3">Makanan Favorit</span>
                </a>
            </li>

            {{-- Dropdown Admin --}}
            <li>
                {{-- PERBAIKAN 1: Menambahkan kelas aktif pada tombol utama dropdown --}}
                <button type="button" class="flex items-center w-full p-2 text-base transition duration-75 rounded-lg group hover:bg-lime-50 hover:text-lime-700 {{ (request()->routeIs('admin.*') || request()->routeIs('makanan.kelola_makanan') || request()->routeIs('auth.user_pengguna')) ? 'bg-lime-100 text-lime-700' : 'text-gray-900' }}" aria-controls="dropdown-admin" data-collapse-toggle="dropdown-admin">
                    <i class="fas fa-user-shield w-6 h-6 text-xl text-gray-500 transition duration-75 group-hover:text-lime-700"></i>
                    <span class="flex-1 ms-3 text-left rtl:text-right whitespace-nowrap">Admin</span>
                    {{-- PERBAIKAN 2: Menambahkan kelas untuk merotasi ikon chevron --}}
                    <i class="fas fa-chevron-down w-3 h-3 transition-transform duration-200 {{ (request()->routeIs('admin.*') || request()->routeIs('makanan.kelola_makanan') || request()->routeIs('auth.user_pengguna')) ? 'rotate-180' : '' }}"></i>
                </button>
                {{-- PERBAIKAN 3: Menghapus kelas 'hidden' secara dinamis jika route aktif --}}
                <ul id="dropdown-admin" class="{{ (request()->routeIs('admin.*') || request()->routeIs('makanan.kelola_makanan') || request()->routeIs('auth.user_pengguna')) ? '' : 'hidden' }} py-2 space-y-2">
                    <li>
                        <a href="{{ route('admin.dashboard') }}" class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg pl-11 group hover:bg-lime-50 hover:text-lime-700 {{ request()->routeIs('admin.dashboard') ? 'bg-lime-100 text-lime-700' : '' }}">
                            <i class="fas fa-tachometer-alt w-5 h-5 text-gray-500 transition duration-75 group-hover:text-lime-700"></i>
                            <span class="ms-3">Dashboard Admin</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('makanan.kelola_makanan') }}" class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg pl-11 group hover:bg-lime-50 hover:text-lime-700 {{ request()->routeIs('makanan.kelola_makanan') ? 'bg-lime-100 text-lime-700' : '' }}">
                            <i class="fas fa-utensils w-5 h-5 text-gray-500 transition duration-75 group-hover:text-lime-700"></i>
                            <span class="ms-3">Kelola Makanan</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('auth.user_pengguna') }}" class="flex items-center w-full p-2 text-gray-900 transition duration-75 rounded-lg pl-11 group hover:bg-lime-50 hover:text-lime-700 {{ request()->routeIs('auth.user_pengguna') ? 'bg-lime-100 text-lime-700' : '' }}">
                            <i class="fas fa-users w-5 h-5 text-gray-500 transition duration-75 group-hover:text-lime-700"></i>
                            <span class="ms-3">Data Pengguna</span>
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</aside>