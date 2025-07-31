<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Maset') }}</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

    <!-- Tailwind & Font Awesome -->
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- flowbite -->
    <script src="{{ asset('node_modules/flowbite/dist/flowbite.js') }}"></script>
    <link rel="stylesheet" href="{{ asset('node_modules/flowbite/dist/flowbite.css') }}">

    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</head>

<body class="bg-gradient-to-br from-lime-100 via-emerald-100 to-lime-200">

    @auth
    {{-- Kondisi untuk menampilkan layout berdasarkan peran pengguna --}}
    @if (auth()->user()->role === 'admin')
    {{-- Layout untuk Admin (dengan Sidebar) --}}
    @include('layouts.navbar')
    @include('layouts.sidebar')

    <div class="p-4 sm:ml-64">
        <div class="p-4 mt-14">
            {{ $slot }}
        </div>
    </div>
    @else
    {{-- Layout untuk Pengguna Biasa (tanpa Sidebar) --}}
    @include('layouts.navbar')

    <main class="pt-20"> {{-- pt-20 untuk memberi ruang di bawah navbar --}}
        {{ $slot }}
    </main>
    @endif
    @else
    {{-- Layout untuk Tamu (Guest) --}}
    @include('layouts.navbar')

    <main class="pt-20">
        {{ $slot }}
    </main>
    @endauth


    @stack('scripts')
</body>

</html>