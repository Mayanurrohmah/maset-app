<nav class="bg-white shadow-md fixed top-0 left-0 right-0 z-50">
    <div class="max-w-7xl mx-auto px-6 py-3 flex justify-between items-center">
        <div class="flex items-center space-x-2">
            <a href="{{ route('makanan.dashboard') }}" title="Beranda">
                <img src="{{ asset('img/logo.png') }}" class="h-9 w-9 rounded-full" alt="Logo">
                <span class="text-xl font-bold text-lime-600">RMS</span>
            </a>
        </div>

        <div class="flex items-center space-x-5 text-gray-700 text-xl">
            <a href="{{ route('makanan.dashboard') }}" title="Beranda" class="hover:text-lime-600 transition">
                <i class="fas fa-home"></i>
            </a>

            <a href="{{ route('makanan.favorit') }}" title="Favorit" class="hover:text-lime-600 transition">
                <i class="fas fa-heart"></i>
            </a>

            <a href="{{ route('profile.edit') }}" title="Profil" class="relative block">
                <img
                    class="h-9 w-9 rounded-full object-cover border-2 border-transparent hover:border-lime-500 transition-colors duration-200"
                    src="{{ Auth::user()->photo ? asset('storage/' . Auth::user()->photo) : 'https://placehold.co/40x40/EEE/666?text=U' }}"
                    alt="{{ Auth::user()->name ?? 'User' }} Avatar"
                    onerror="this.onerror=null;this.src='https://placehold.co/40x40/EEE/666?text=U';" />
                {{-- Active Status Indicator (green dot) --}}
                @if(Auth::user()->is_active_status_enabled) {{-- Show if the user has enabled active status --}}
                <span class="absolute bottom-0 right-0 h-3 w-3 rounded-full bg-green-500 border-2 border-white animate-pulse"></span>
                @endif
            </a>


            <form method="POST" action="{{ route('logout') }}">
                @csrf
                <button type="submit" title="Logout" class="hover:text-red-500 transition">
                    <i class="fas fa-sign-out-alt text-xl"></i>
                </button>
                <!-- <x-dropdown-link :href="route('logout')"
                    onclick="event.preventDefault();
                                                this.closest('form').submit();">
                    {{ __('Log Out') }}
                </x-dropdown-link> -->
            </form>
        </div>
    </div>
</nav>