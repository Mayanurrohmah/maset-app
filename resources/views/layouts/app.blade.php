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

    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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
            <!-- Hamburger Icon (mobile only) -->
            <div class="md:hidden fixed top-4 left-4 z-50">
                <button id="hamburger-toggle" class="text-gray-800 bg-white shadow p-2 rounded-full focus:outline-none">
                    <i class="fas fa-bars text-xl"></i>
                </button>
            </div>

            <!-- Overlay -->
            <div id="sidebar-overlay" class="fixed inset-0 bg-black opacity-50 z-40 hidden md:hidden"></div>

            <div class="min-h-screen flex relative">
                @include('layouts.sidebar')

                <div id="main-content" class="flex-1 md:ml-64 p-6">
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

            const mobileToggle = document.getElementById('hamburger-toggle');
            const sidebarOverlay = document.getElementById('sidebar-overlay');
            const sidebarClose = document.getElementById('hamburger-btn-sidebar');

            if (mobileToggle && sidebar && sidebarOverlay) {
                mobileToggle.addEventListener('click', () => {
                    sidebar.classList.remove('-translate-x-full');
                    sidebarOverlay.classList.remove('hidden');
                });
            }

            if (sidebarClose && sidebar && sidebarOverlay) {
                sidebarClose.addEventListener('click', () => {
                    sidebar.classList.add('-translate-x-full');
                    sidebarOverlay.classList.add('hidden');
                });
            }

            if (sidebarOverlay && sidebar) {
                sidebarOverlay.addEventListener('click', () => {
                    sidebar.classList.add('-translate-x-full');
                    sidebarOverlay.classList.add('hidden');
                });
            }

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

    <!-- Tempat grafik/chart akan ditampilkan -->
    @stack('scripts')
</body>
</html>
