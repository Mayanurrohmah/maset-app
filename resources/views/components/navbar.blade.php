<nav class="bg-lime-500 fixed top-0 w-full shadow z-50">
    <div class="max-w-7xl mx-auto px-4 py-4 flex justify-between items-center text-white">
        <div class="text-xl font-bold">Maset</div>
        <ul class="flex space-x-6">
            <li><a href="{{ route('dashboard') }}" class="hover:underline">Home</a></li>
            <li><a href="{{ route('makanan.rekomendasi_makanan') }}" class="hover:underline">Rekomendasi</a></li>
            <li><a href="{{ route('makanan.favorit') }}" class="hover:underline">Favorit</a></li>
            <li>
                <form method="POST" action="{{ route('logout') }}">
                    @csrf
                    <button type="submit" class="hover:underline">Logout</button>
                </form>
            </li>
        </ul>
    </div>
</nav>
