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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* Custom CSS for smooth transitions and sidebar behavior */
        #sidebar,
        #main-content {
            transition: all 0.3s ease-in-out;
        }

        /* When sidebar is collapsed, shrink its width and hide the text */
        #sidebar.collapsed {
            width: 5rem;
            /* 80px */
        }

        #sidebar.collapsed .sidebar-text {
            display: none;
        }

        #sidebar.collapsed .profile-text {
            display: none;
        }

        /* When sidebar is collapsed, adjust the main content's margin */
        #main-content.collapsed {
            margin-left: 5rem;
            /* 80px */
        }

        #sidebar.collapsed .menu-item {
            justify-content: center;
        }
    </style>
</head>

<body class="bg-white font-sans">
    <div class="min-h-screen flex">

        @include('layouts.sidebar')

        <!-- Konten utama -->
        <div id="main-content" class="flex-1 ml-64 p-6">
            <!-- <main id="main-content" class="ml-64 p-8"> -->
            {{ $slot }}
            <!-- </main> -->
        </div>
    </div>
</body>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const hamburgerBtn = document.getElementById('hamburger-btn');
        const sidebar = document.getElementById('sidebar');
        const mainContent = document.getElementById('main-content');
        const adminDropdownBtn = document.getElementById('admin-dropdown-btn');
        const adminDropdown = document.getElementById('admin-dropdown');
        const adminChevron = document.getElementById('admin-chevron');

        // --- LOGIKA HAMBURGER MENU ---
        if (hamburgerBtn && sidebar && mainContent) {
            hamburgerBtn.addEventListener('click', () => {
                sidebar.classList.toggle('collapsed');
                mainContent.classList.toggle('collapsed');

                // **BARU**: Jika sidebar diciutkan, tutup dropdown admin
                if (sidebar.classList.contains('collapsed')) {
                    if (adminDropdown) {
                        adminDropdown.classList.add('hidden');
                        adminChevron.classList.remove('rotate-180');
                        localStorage.setItem('adminDropdownState', 'closed');
                    }
                }
            });
        }

        // --- LOGIKA DROPDOWN ADMIN YANG STATEFUL ---
        if (adminDropdownBtn && adminDropdown && adminChevron) {
            // Saat halaman dimuat, periksa status dari localStorage
            if (localStorage.getItem('adminDropdownState') === 'open') {
                // Jangan buka dropdown jika sidebar sudah diciutkan
                if (!sidebar.classList.contains('collapsed')) {
                    adminDropdown.classList.remove('hidden');
                    adminChevron.classList.add('rotate-180');
                }
            }

            // Tambahkan event listener untuk klik
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

</html>