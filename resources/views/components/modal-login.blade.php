<div id="loginModal" class="fixed inset-0 bg-black bg-opacity-40 z-50 hidden flex items-center justify-center">
  <div class="bg-white rounded-xl shadow-2xl max-w-4xl w-full mx-4 flex flex-wrap overflow-hidden relative animate-fadeIn">

    <!-- Tombol Close -->
    <button id="closeLoginModal" type="button"
      class="absolute top-3 right-4 text-gray-500 text-3xl font-bold hover:text-red-500 transition">
      &times;
    </button>

    <!-- Left Image -->
    <div class="flex-1 min-w-[300px] h-[400px] md:h-auto bg-cover bg-center"
         style="background-image: url('{{ asset('img/login.png') }}');">
    </div>

    <!-- Right Form -->
     <div class="flex-1 p-8 min-w-[300px] bg-gradient-to-br from-green-50 via-white to-green-100">
      <h2 class="text-2xl font-bold text-center mb-6 text-gray-800">Login</h2>

      @if (session('error'))
        <div class="bg-red-100 text-red-700 border border-red-300 rounded p-3 text-sm mb-4 text-center">
          {{ session('error') }}
        </div>
      @endif

      @if ($errors->any())
        <div class="bg-red-100 text-red-700 border border-red-300 rounded p-3 text-sm mb-4">
          @foreach ($errors->all() as $error)
            <div>{{ $error }}</div>
          @endforeach
        </div>
      @endif

      <form id="loginForm" method="POST" action="{{ route('login') }}">
        @csrf

        <div class="mb-4">
          <input type="email" name="email" id="email" placeholder="Email" required
            class="w-full px-4 py-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-green-400" />
        </div>

        <div class="mb-4">
          <input type="password" name="password" id="password" placeholder="Password" required
            class="w-full px-4 py-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-green-400" />
        </div>

        <div class="mb-4 text-sm flex items-center">
          <input type="checkbox" name="remember" class="mr-2" />
          <label for="remember">Remember me</label>
        </div>

        <button type="submit"
          class="w-full py-3 bg-green-500 hover:bg-green-600 text-white rounded-md font-semibold transition duration-300">
          Login
        </button>
        
        <div class="text-center text-sm mt-4">
             Belum punya akun?
              <button type="button" id="openRegisterModal"
              class="text-green-600 font-semibold hover:underline transition">
               Daftar Sekarang
            </button>
        </div>
      </form>
    </div>
  </div>
</div>
