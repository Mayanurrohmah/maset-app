<aside id="sidebar" class="w-64 bg-white text-gray-800 shadow-lg fixed top-0 left-0 z-50 h-full overflow-y-auto transition-transform duration-300 transform -translate-x-full md:translate-x-0 rounded-r-3xl">

    <div id="sidebar-overlay" class="fixed inset-0 bg-black opacity-50 z-40 hidden md:hidden"></div>

    <div class="p-6 space-y-6">
        <div class="flex items-center justify-between mb-8">
            <button id="hamburger-btn-sidebar" class="md:hidden text-gray-600 hover:text-gray-900 focus:outline-none">
                <i class="fas fa-times text-2xl"></i>
            </button>
        </div>

        <nav class="space-y-3">
            <a href="{{ route('profile.edit') }}" class="flex items-center gap-4 p-3 rounded-xl hover:bg-gray-100 hover:text-gray-800 transition duration-200 {{ request()->routeIs('profile.edit') ? 'bg-gray-100 text-gray-800 font-semibold' : '' }}">
                <div class="w-10 h-10 rounded-full overflow-hidden border-2 border-lime-400">
                    {{-- DYNAMIC PROFILE PICTURE - FIX APPLIED HERE --}}
                    <img src="{{ Auth::user()->photo ? asset('storage/' . Auth::user()->photo) : asset('images/default_profile.jpg') }}" alt="Profile" class="w-full h-full object-cover">
                </div>
                <div>
                    <p class="font-semibold text-base">Hello {{ auth()->user()->name }}</p>
                </div>
            </a>

            <div class="pt-6 mt-6 border-t border-gray-200 space-y-3">
                <h3 class="text-xs font-semibold text-gray-500 uppercase tracking-wider pl-3 mb-2">Menu</h3>
                <a href="{{ route('makanan.dashboard') }}" class="flex items-center gap-4 p-3 rounded-xl hover:bg-lime-50 hover:text-lime-700 transition duration-200 {{ request()->routeIs('makanan.dashboard') ? 'bg-lime-100 text-lime-700 font-semibold' : '' }}">
                    <i class="fas fa-chart-pie w-6 h-6 text-xl"></i>
                    <span class="text-lg">Dashboard</span>
                </a>

                <a href="{{ route('makanan.rekomendasi_makanan') }}" class="flex items-center gap-4 p-3 rounded-xl hover:bg-lime-50 hover:text-lime-700 transition duration-200 {{ request()->routeIs('makanan.rekomendasi_makanan') ? 'bg-lime-100 text-lime-700 font-semibold' : '' }}">
                    <i class="fas fa-utensils w-6 h-6 text-xl"></i>
                    <span class="text-lg">Daftar Makanan</span>
                </a>
                <a href="{{ route('makanan.favorit') }}" class="flex items-center gap-4 p-3 rounded-xl hover:bg-lime-50 hover:text-lime-700 transition duration-200 {{ request()->routeIs('makanan.rekomendasi_makanan') ? 'bg-lime-100 text-lime-700 font-semibold' : '' }}">
                    <i class="fas fa-utensils w-6 h-6 text-xl"></i>
                    <span class="text-lg">Makanan Favorit</span>
                </a>
            </div>

            <div class="pt-6 mt-4 border-t border-gray-200 space-y-3">
                <div>
                    <button id="admin-dropdown-btn" class="w-full flex items-center justify-between p-3 rounded-xl hover:bg-lime-50 hover:text-lime-700 transition duration-200 {{ request()->routeIs('admin.*') || request()->routeIs('makanan.kelola_makanan') || request()->routeIs('auth.user_activity') ? 'bg-lime-100 text-lime-700 font-semibold' : '' }}">
                        <div class="flex items-center gap-4">
                            <i class="fas fa-user-shield w-6 h-6 text-xl"></i>
                            <span class="text-base">Admin</span> {{-- Diperkecil jadi text-base --}}
                        </div>
                        <i id="admin-chevron" class="fas fa-chevron-down text-sm transition-transform duration-200 {{ (request()->routeIs('admin.*') || request()->routeIs('makanan.kelola_makanan') || request()->routeIs('auth.user_activity')) ? 'rotate-180' : '' }}"></i>
                    </button>

                    <div id="admin-dropdown" class="mt-2 space-y-2 pl-8 {{ (request()->routeIs('admin.*') || request()->routeIs('makanan.kelola_makanan') || request()->routeIs('auth.user_activity')) ? 'block' : 'hidden' }}">
                        <a href="{{ route('admin.dashboard') }}" class="flex items-center gap-4 p-3 rounded-xl hover:bg-lime-50 hover:text-lime-700 transition duration-200 {{ request()->routeIs('admin.dashboard') ? 'bg-lime-100 text-lime-700 font-semibold' : '' }}">
                            <i class="fas fa-tachometer-alt w-6 h-6 text-lg"></i>
                            <span class="text-sm">Dashboard Admin</span>
                        </a>
                        <a href="{{ route('makanan.kelola_makanan') }}" class="flex items-center gap-4 p-3 rounded-xl hover:bg-lime-50 hover:text-lime-700 transition duration-200 {{ request()->routeIs('makanan.kelola_makanan') ? 'bg-lime-100 text-lime-700 font-semibold' : '' }}">
                            <i class="fas fa-utensils w-6 h-6 text-lg"></i>
                            <span class="text-sm">Kelola Data Makanan</span>
                        </a>
                        <a href="{{ route('auth.user_activity') }}" class="flex items-center gap-4 p-3 rounded-xl hover:bg-lime-50 hover:text-lime-700 transition duration-200 {{ request()->routeIs('auth.user_activity') ? 'bg-lime-100 text-lime-700 font-semibold' : '' }}">
                            <i class="fas fa-chart-line w-6 h-6 text-lg"></i>
                            <span class="text-sm">Aktivitas Pengguna</span>
                        </a>
                    </div>
                </div>
            </div>

            <form method="POST" action="{{ route('logout') }}" class="mt-8 pt-6 border-t border-gray-200">
                @csrf
                <button type="submit" class="w-full flex items-center gap-4 p-3 rounded-xl text-red-600 hover:bg-red-50 hover:text-red-700 transition duration-200">
                    <i class="fas fa-sign-out-alt w-6 h-6 text-xl"></i>
                    <span class="text-lg">Logout</span>
                </button>
            </form>
        </nav>
    </div>
</aside>