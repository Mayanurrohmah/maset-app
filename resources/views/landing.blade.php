<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Sistem Rekomendasi Makanan Sehat</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
  <link rel="stylesheet" href="https://unpkg.com/aos@2.3.4/dist/aos.css" />
  <style>
    @keyframes float {
      0% { transform: translateY(0); }
      50% { transform: translateY(-10px); }
      100% { transform: translateY(0); }
    }
    .floating {
      animation: float 5s ease-in-out infinite;
    }
  </style>
</head>
<body class="bg-gradient-to-br from-green-50 via-white to-green-100 text-gray-800 font-sans overflow-x-hidden relative">

  <!-- Header -->
  <header class="container mx-auto px-6 py-5 flex justify-between items-center z-20 relative">
    <div class="flex items-center text-xl font-bold text-gray-800">
      <img src="{{ asset('img/logo.png') }}" class="h-8 mr-2" alt="Logo" />
      <span class="text-green-500">RMS</span>
    </div>
    <button id="openLoginModal"
      class="bg-white text-green-600 border border-green-500 px-5 py-2 rounded-full hover:bg-green-100 transition font-medium shadow">
      Login
    </button>
  </header>

  <!-- Hero Section -->
  <section class="relative py-20 md:py-28 overflow-hidden">
    <img src="{{ asset('img/buah.png') }}" alt="Buah" class="absolute left-0 bottom-0 w-44 md:w-60 floating opacity-70 z-0" />
    <img src="{{ asset('img/sayur.png') }}" alt="Sayur" class="absolute right-0 top-10 w-36 md:w-48 floating opacity-60 z-0" />

    <div class="container mx-auto px-6 md:px-10 flex flex-col-reverse md:flex-row items-center justify-between relative z-10">
      <div class="md:w-1/2 text-center md:text-left" data-aos="fade-up">
        <h1 class="text-4xl md:text-5xl font-extrabold leading-tight mb-5 text-gray-800">
          Dapatkan <span class="text-green-600">Rekomendasi Makanan Sehat</span><br> Sesuai Kebutuhan Anda
        </h1>
        <p class="text-lg text-gray-600 mb-6">
          Rekomendasi cerdas untuk menu sehat berdasarkan anggaran dan preferensi diet Anda.
        </p>
      </div>

      <div class="md:w-1/2 flex justify-center mb-10 md:mb-0" data-aos="zoom-in">
        <div class="w-[260px] h-[260px] md:w-[320px] md:h-[320px] bg-white rounded-full shadow-xl overflow-hidden flex items-center justify-center floating">
          <img src="{{ asset('img/salad2.png') }}" alt="Makanan Sehat" class="w-full h-full object-cover rounded-full" />
        </div>
      </div>
    </div>
  </section>

  <!-- Include Modals -->
  @include('components.modal-login')
  @include('components.modal-register')

  <!-- Scripts -->
  <script src="https://unpkg.com/aos@2.3.4/dist/aos.js"></script>
  <script>
    AOS.init({ duration: 1000, once: true });

    const loginModal = document.getElementById("loginModal");
    const registerModal = document.getElementById("registerModal");

    // Open Login Modal
    document.getElementById("openLoginModal")?.addEventListener("click", () => {
      loginModal.classList.remove("hidden");
    });

    // Close Login Modal
    document.getElementById("closeLoginModal")?.addEventListener("click", () => {
      loginModal.classList.add("hidden");
    });

    // Open Register Modal from Login
    document.getElementById("openRegisterModal")?.addEventListener("click", () => {
      loginModal.classList.add("hidden");
      registerModal.classList.remove("hidden");
    });

    // Back to Login Modal from Register
    document.getElementById("backToLoginModal")?.addEventListener("click", () => {
      registerModal.classList.add("hidden");
      loginModal.classList.remove("hidden");
    });

    // Close Register Modal
    document.getElementById("closeRegisterModal")?.addEventListener("click", () => {
      registerModal.classList.add("hidden");
    });

    // Close modal if clicked outside content
    window.addEventListener("click", (e) => {
      if (e.target === loginModal) loginModal.classList.add("hidden");
      if (e.target === registerModal) registerModal.classList.add("hidden");
    });
  </script>
</body>
</html>
