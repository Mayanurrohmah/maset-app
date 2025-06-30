<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

    <!-- Scripts -->
    @vite(['resources/css/app.css', 'resources/js/app.js'])

    <!-- taildwind -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-white font-sans">
    <div class="min-h-screen flex">

        @include('layouts.sidebar')

        <!-- Konten utama -->
        <div class="flex-1 ml-64 p-6">
            {{ $slot }}
        </div>
    </div>
</body>



</html>