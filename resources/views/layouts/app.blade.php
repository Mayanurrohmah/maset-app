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

    <style>
        #sidebar,
        #main-content {
            transition: all 0.3s ease-in-out;
        }

        #sidebar.collapsed {
            width: 5rem;
        }

        #sidebar.collapsed .sidebar-text,
        #sidebar.collapsed .profile-text {
            display: none;
        }

        #main-content.collapsed {
            margin-left: 5rem;
        }

        #sidebar.collapsed .menu-item {
            justify-content: center;
        }
    </style>
</head>

<body class="min-h-screen font-sans bg-gradient-to-br from-lime-100 via-emerald-100 to-lime-200 bg-fixed bg-no-repeat bg-cover">
    @auth
        @if(auth()->user()->role === 'admin')
            <div class="min-h-screen flex">
                @include('layouts.sidebar')
                <div id="main-content" class="flex-1 ml-64 p-6">
                    {{ $slot }}
                </div>
            </div>
        @else
            @include('layouts.navbar')
            <main class="pt-16 px-4">
                {{ $slot }}
            </main>
        @endif
    @endauth

    @guest
        @include('layouts.navbar')
        <main class="pt-16 px-4">
            {{ $slot }}
        </main>
    @endguest

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const hamburgerBtn = document.getElementById('hamburger-btn');
            const sidebar = document.getElementById('sidebar');
            const mainContent = document.getElementById('main-content');
            const adminDropdownBtn = document.getElementById('admin-dropdown-btn');
            const adminDropdown = document.getElementById('admin-dropdown');
            const adminChevron = document.getElementById('admin-chevron');

            if (hamburgerBtn && sidebar && mainContent) {
                hamburgerBtn.addEventListener('click', () => {
                    sidebar.classList.toggle('collapsed');
                    mainContent.classList.toggle('collapsed');

                    if (sidebar.classList.contains('collapsed')) {
                        if (adminDropdown) {
                            adminDropdown.classList.add('hidden');
                            adminChevron.classList.remove('rotate-180');
                            localStorage.setItem('adminDropdownState', 'closed');
                        }
                    }
                });
            }

            if (adminDropdownBtn && adminDropdown && adminChevron) {
                if (localStorage.getItem('adminDropdownState') === 'open') {
                    if (!sidebar.classList.contains('collapsed')) {
                        adminDropdown.classList.remove('hidden');
                        adminChevron.classList.add('rotate-180');
                    }
                }

                adminDropdownBtn.addEventListener('click', () => {
                    const isHidden = adminDropdown.classList.contains('hidden');
                    if (isHidden) {
                        adminDropdown.classList.remove('hidden');
                        adminChevron.classList.add('rotate-180');
                        localStorage.setItem('adminDropdownState', 'open');
                    } else {
                        adminDropdown.classList.add('hidden');
                        adminChevron.classList.remove('rotate-180');
                        localStorage.setItem('adminDropdownState', 'closed');
                    }
                });
            }
        });
    </script>
</body>

</html>
