 <!-- Sidebar -->

 <aside class="w-64 bg-lime-400 text-black h-screen p-5 fixed top-0 left-0 z-40">
     <div class="space-y-6">
         <!-- Hamburger Icon (opsional untuk mobile) -->
         <div class="text-2xl">
             <i class="fas fa-bars"></i>
         </div>

         <div class="space-y-4">
             <div class="flex items-center gap-2">
                 <a href="{{ route('profile.edit') }}" class="flex items-center gap-2 hover:underline">
                     <img src="https://img.icons8.com/ios-filled/24/user.png" class="w-6 h-6" />
                     <span>Hallo {{ auth()->user()->name }}</span>
             </div>

             <!-- Menu khusus Admin -->
             @if (auth()->user()->role === 'admin')
             <a href="{{ route('makanan.kelola_makanan') }}" class="flex items-center gap-2 hover:underline">
                 <img src="https://img.icons8.com/ios-filled/24/restaurant.png" class="w-6 h-6" />
                 <span>Kelola Data Makanan</span>
             </a>

             <a href="{{ route('auth.user_activity') }}" class="flex items-center gap-2 hover:underline">
                 <img src="https://img.icons8.com/ios-filled/24/combo-chart.png" class="w-6 h-6" />
                 <span>Aktivitas Pengguna</span>
             </a>
             @endif

             <a href="{{ route('makanan.rekomendasi_makanan') }}" class="flex items-center gap-2 hover:underline">
                 <img src="https://img.icons8.com/ios-filled/24/restaurant.png" class="w-6 h-6" />
                 <span>Rekomendasi Makanan</span>
             </a>

             <a href="{{ route('makanan.detail_makanan') }}" class="flex items-center gap-2 hover:underline">
                 <img src="https://img.icons8.com/ios-filled/24/restaurant.png" class="w-6 h-6" />
                 <span>Detail Makanan</span>
             </a>

             <a href="{{ route('makanan.favorit') }}" class="flex items-center gap-2 hover:underline">
                 <img src="https://img.icons8.com/ios-filled/24/restaurant.png" class="w-6 h-6" />
                 <span>Favorit</span>
             </a>

             <!-- <a href="{{ route('auth.user_activity') }}" class="flex items-center gap-2 hover:underline">
                 <img src="https://img.icons8.com/ios-filled/24/combo-chart.png" class="w-6 h-6" />
                 <span>Aktivitas Pengguna</span>
             </a> -->

             <form method="POST" action="{{ route('logout') }}">
                 @csrf
                 <button type="submit" class="flex items-center gap-2 hover:underline">
                     <img src="https://img.icons8.com/ios-filled/24/exit.png" class="w-6 h-6" />
                     <span>Logout</span>
                 </button>
             </form>
         </div>
     </div>
 </aside>