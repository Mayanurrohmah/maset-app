<div id="registerModal" class="fixed inset-0 bg-black bg-opacity-40 z-50 hidden flex items-center justify-center">
  <div class="bg-gradient-to-br from-green-100 via-white to-green-50 rounded-xl shadow-2xl w-full max-w-md mx-4 relative animate-fadeIn">

    <!-- Tombol Close -->
    <button id="closeRegisterModal" class="absolute top-3 right-4 text-gray-500 text-3xl font-bold hover:text-red-500 transition">
      &times;
    </button>

    <div class="px-8 py-10">
      <h2 class="text-3xl font-extrabold text-center mb-6 text-gray-800">Register</h2>

      <form method="POST" action="{{ route('register') }}">
        @csrf

        <div class="mb-4">
          <input type="text" name="name" placeholder="Nama Lengkap" required
            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-400" />
        </div>

        <div class="mb-4">
          <input type="email" name="email" placeholder="Email" required
            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-400" />
        </div>

        <div class="mb-4">
          <input type="password" name="password" placeholder="Password" required
            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-400" />
        </div>

        <div class="mb-6">
          <input type="password" name="password_confirmation" placeholder="Konfirmasi Password" required
            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-400" />
        </div>

        <button type="submit"
          class="w-full py-3 bg-green-500 hover:bg-green-600 text-white rounded-lg font-semibold transition duration-300 shadow-md">
          Daftar Sekarang
        </button>

        <p class="text-center text-sm mt-5">
          Sudah punya akun?
          <button type="button" id="backToLoginModal"
            class="text-green-600 font-semibold hover:underline transition">
            Login
          </button>
        </p>
      </form>
    </div>
  </div>
</div>
