<!-- Sidebar -->
<aside id="sidebar" class="w-64 bg-lime-400 text-black h-screen p-5 fixed top-0 left-0 z-40 overflow-y-auto">
    <div class="space-y-6">
        <!-- Tombol Ikon Hamburger -->
        <button id="hamburger-btn" class="text-2xl text-black focus:outline-none">
            <i class="fas fa-bars"></i>
        </button>

        <div class="space-y-2">
            <div class="p-2 rounded-md">
                <a href="{{ route('profile.edit') }}" class="flex items-center gap-2">
                    <img src="https://img.icons8.com/ios-filled/24/user.png" class="w-6 h-6" alt="user-icon" />
                    <span class="sidebar-text profile-text">Hallo {{ auth()->user()->name }}</span>
                </a>
            </div>

            <a href="{{ route('makanan.dashboard') }}" class="flex items-center gap-2 p-2 rounded-md transition-colors duration-200 ease-in-out hover:bg-lime-500">
                <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" class="w-6 h-6 flex-shrink-0" viewBox="0 0 64 64">
                    <path d="M 32 8 C 31.08875 8 30.178047 8.3091875 29.435547 8.9296875 L 8.8007812 26.171875 C 8.0357812 26.810875 7.7634844 27.925203 8.2714844 28.783203 C 8.9184844 29.875203 10.35025 30.088547 11.28125 29.310547 L 12 28.710938 L 12 47 C 12 49.761 14.239 52 17 52 L 47 52 C 49.761 52 52 49.761 52 47 L 52 28.712891 L 52.71875 29.3125 C 53.09275 29.6255 53.546047 29.777344 53.998047 29.777344 C 54.693047 29.777344 55.382672 29.416656 55.763672 28.722656 C 56.228672 27.874656 55.954891 26.803594 55.212891 26.183594 L 52 23.498047 L 52 15 C 52 13.895 51.105 13 50 13 L 48 13 C 46.895 13 46 13.895 46 15 L 46 18.484375 L 34.564453 8.9296875 C 33.821953 8.3091875 32.91125 8 32 8 z M 32 12.152344 C 32.11475 12.152344 32.228766 12.191531 32.322266 12.269531 L 48 25.369141 L 48 46 C 48 47.105 47.105 48 46 48 L 38 48 L 38 34 C 38 32.895 37.105 32 36 32 L 28 32 C 26.895 32 26 32.895 26 34 L 26 48 L 18 48 C 16.895 48 16 47.105 16 46 L 16 25.367188 L 31.677734 12.269531 C 31.771234 12.191531 31.88525 12.152344 32 12.152344 z"></path>
                </svg>
                <span class="sidebar-text">Home</span>
            </a>

            <!-- Dropdown Menu Admin -->
            @if (auth()->user()->role === 'admin')
            <div>
                <!-- Tombol Dropdown -->
                <button id="admin-dropdown-btn" class="w-full flex items-center justify-between gap-2 p-2 rounded-md transition-colors duration-200 ease-in-out hover:bg-lime-500 text-left">
                    <div class="flex items-center gap-2">
                        <i class="fas fa-user-shield w-6 h-6 flex-shrink-0 text-center"></i>
                        <span class="sidebar-text">Admin</span>
                    </div>
                    <i id="admin-chevron" class="fas fa-chevron-down sidebar-text transition-transform duration-200"></i>
                </button>

                <!-- Konten Dropdown -->
                <div id="admin-dropdown" class="hidden mt-2 space-y-2 pl-4">
                    <a href="{{ route('admin.dashboard') }}" class="flex items-center gap-2 p-2 rounded-md transition-colors duration-200 ease-in-out hover:bg-lime-500">
                       <img width="50" height="50" src="https://img.icons8.com/ios/50/control-panel--v2.png" alt="control-panel--v2" class="w-6 h-6 flex-shrink-0"/> 
                        <span class="sidebar-text">Dashboard Admin</span>
                    </a>
                    <a href="{{ route('makanan.kelola_makanan') }}" class="flex items-center gap-2 p-2 rounded-md transition-colors duration-200 ease-in-out hover:bg-lime-500">
                        <img src="https://img.icons8.com/parakeet-line/48/business.png" alt="business" class="w-6 h-6 flex-shrink-0" />
                        <span class="sidebar-text">Kelola Data Makanan</span>
                    </a>
                    <a href="{{ route('auth.user_activity') }}" class="flex items-center gap-2 p-2 rounded-md transition-colors duration-200 ease-in-out hover:bg-lime-500">
                        <img src="https://img.icons8.com/ios/50/combo-chart--v1.png" alt="combo-chart--v1" class="w-6 h-6 flex-shrink-0" />
                        <span class="sidebar-text">Aktivitas Pengguna</span>
                    </a>
                </div>
            </div>
            @endif

            <a href="{{ route('makanan.rekomendasi_makanan') }}" class="flex items-center gap-2 p-2 rounded-md transition-colors duration-200 ease-in-out hover:bg-lime-500">
                <img src="https://img.icons8.com/ios/50/restaurant.png" alt="restaurant" class="w-6 h-6 flex-shrink-0" />
                <span class="sidebar-text">Rekomendasi Makanan</span>
            </a>

            <a href="{{ route('makanan.favorit') }}" class="flex items-center gap-2 p-2 rounded-md transition-colors duration-200 ease-in-out hover:bg-lime-500">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6 flex-shrink-0">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M17.593 3.322c1.1.128 1.907 1.077 1.907 2.185V21L12 17.25 4.5 21V5.507c0-1.108.806-2.057 1.907-2.185a48.507 48.507 0 0 1 11.186 0Z" />
                </svg>
                <span class="sidebar-text">Favorit</span>
            </a>

            <form method="POST" action="{{ route('logout') }}">
                @csrf
                <button type="submit" class="w-full flex items-center gap-2 p-2 rounded-md transition-colors duration-200 ease-in-out hover:bg-lime-500 text-left">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6 flex-shrink-0">
                        <path fill-rule="evenodd" d="M16.5 3.75a1.5 1.5 0 0 1 1.5 1.5v13.5a1.5 1.5 0 0 1-1.5 1.5h-6a1.5 1.5 0 0 1-1.5-1.5V15a.75.75 0 0 0-1.5 0v3.75a3 3 0 0 0 3 3h6a3 3 0 0 0 3-3V5.25a3 3 0 0 0-3-3h-6a3 3 0 0 0-3 3V9A.75.75 0 1 0 9 9V5.25a1.5 1.5 0 0 1 1.5-1.5h6ZM5.78 8.47a.75.75 0 0 0-1.06 0l-3 3a.75.75 0 0 0 0 1.06l3 3a.75.75 0 0 0 1.06-1.06l-1.72-1.72H15a.75.75 0 0 0 0-1.5H4.06l1.72-1.72a.75.75 0 0 0 0-1.06Z" clip-rule="evenodd" />
                    </svg>
                    <span class="sidebar-text">Logout</span>
                </button>
            </form>
        </div>
    </div>
</aside>