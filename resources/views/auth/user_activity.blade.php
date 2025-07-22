<x-app-layout>
    <div class="max-w-7xl mx-auto px-6 py-10">
        <div class="bg-white p-8 rounded-xl shadow-lg">
            <h2 class="text-3xl font-bold text-center text-green-700 mb-8">Riwayat Aktivitas Pengguna</h2>

            <!-- Tabs + Filter Wrapper -->
            <div class="flex flex-wrap justify-center md:justify-between items-center gap-4 mb-6">
                <!-- Tabs -->
                <div class="bg-green-100 rounded-lg p-1 shadow-inner">
                    <button id="tabAdmin" class="px-5 py-2 rounded-l-lg text-sm font-semibold transition bg-green-600 text-white">Admin</button>
                    <button id="tabUser" class="px-5 py-2 rounded-r-lg text-sm font-semibold transition text-green-800 hover:bg-green-200">User</button>
                </div>

                <!-- Filter Admin -->
                <form id="adminFilterForm" method="GET" action="{{ route('auth.user_activity') }}" class="flex flex-wrap items-center gap-3">
                    <input type="text" name="admin_search" value="{{ request('admin_search') }}" placeholder="Cari nama/aksi..." class="rounded-lg border-gray-300 shadow-sm text-sm p-2 w-44 focus:ring-green-500">
                    <input type="text" name="admin_date_range" value="{{ request('admin_date_range') }}" placeholder="YYYY-MM-DD s.d YYYY-MM-DD" class="rounded-lg border-gray-300 shadow-sm text-sm p-2 w-64 focus:ring-green-500">
                    <button type="submit" class="bg-green-600 hover:bg-green-700 text-white text-sm px-4 py-2 rounded-lg shadow">Cari</button>
                </form>

                <!-- Filter User -->
                <form id="userFilterForm" method="GET" action="{{ route('auth.user_activity') }}" class="flex flex-wrap items-center gap-3 hidden">
                    <input type="text" name="user_search" value="{{ request('user_search') }}" placeholder="Cari nama/aksi..." class="rounded-lg border-gray-300 shadow-sm text-sm p-2 w-44 focus:ring-green-500">
                    <input type="text" name="user_date_range" value="{{ request('user_date_range') }}" placeholder="YYYY-MM-DD s.d YYYY-MM-DD" class="rounded-lg border-gray-300 shadow-sm text-sm p-2 w-64 focus:ring-green-500">
                    <button type="submit" class="bg-green-600 hover:bg-green-700 text-white text-sm px-4 py-2 rounded-lg shadow">Cari</button>
                </form>
            </div>

            <!-- Admin Table -->
            <div id="adminTab">
                <h3 class="text-xl font-semibold text-green-700 mb-3">Aktivitas Admin</h3>
                <div class="overflow-x-auto bg-white shadow rounded-lg border border-gray-200">
                    <table class="min-w-full text-sm text-left">
                        <thead class="bg-green-100 text-green-800">
                            <tr>
                                <th class="px-4 py-3">No</th>
                                <th class="px-4 py-3">Nama</th>
                                <th class="px-4 py-3">Aksi</th>
                                <th class="px-4 py-3">Waktu</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-100">
                            @forelse ($adminLogs as $index => $log)
                                <tr class="hover:bg-green-50 transition">
                                    <td class="px-4 py-2">{{ $adminLogs->firstItem() + $index }}</td>
                                    <td class="px-4 py-2">{{ $log->user->name }}</td>
                                    <td class="px-4 py-2">{{ $log->aksi }}</td>
                                    <td class="px-4 py-2">{{ $log->created_at->format('d-m-Y H:i') }}</td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="4" class="px-4 py-3 text-center text-gray-500">Tidak ada aktivitas admin</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
                <div class="mt-4">{{ $adminLogs->appends(request()->query())->fragment('admin')->links() }}</div>
            </div>

            <!-- User Table -->
            <div id="userTab" class="hidden">
                <h3 class="text-xl font-semibold text-green-700 mb-3">Aktivitas User</h3>
                <div class="overflow-x-auto bg-white shadow rounded-lg border border-gray-200">
                    <table class="min-w-full text-sm text-left">
                        <thead class="bg-green-100 text-green-800">
                            <tr>
                                <th class="px-4 py-3">No</th>
                                <th class="px-4 py-3">Nama</th>
                                <th class="px-4 py-3">Aksi</th>
                                <th class="px-4 py-3">Waktu</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-100">
                            @forelse ($userLogs as $index => $log)
                                <tr class="hover:bg-green-50 transition">
                                    <td class="px-4 py-2">{{ $userLogs->firstItem() + $index }}</td>
                                    <td class="px-4 py-2">{{ $log->user->name }}</td>
                                    <td class="px-4 py-2">{{ $log->aksi }}</td>
                                    <td class="px-4 py-2">{{ $log->created_at->format('d-m-Y H:i') }}</td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="4" class="px-4 py-3 text-center text-gray-500">Tidak ada aktivitas user</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
                <div class="mt-4">{{ $userLogs->appends(request()->query())->fragment('user')->links() }}</div>
            </div>
        </div>
    </div>

    <script>
        const tabAdmin = document.getElementById("tabAdmin");
        const tabUser = document.getElementById("tabUser");
        const adminTab = document.getElementById("adminTab");
        const userTab = document.getElementById("userTab");
        const adminFilter = document.getElementById("adminFilterForm");
        const userFilter = document.getElementById("userFilterForm");

        tabAdmin.addEventListener("click", () => {
            adminTab.classList.remove("hidden");
            userTab.classList.add("hidden");
            adminFilter.classList.remove("hidden");
            userFilter.classList.add("hidden");

            tabAdmin.classList.add("bg-green-600", "text-white");
            tabUser.classList.remove("bg-green-600", "text-white");
        });

        tabUser.addEventListener("click", () => {
            userTab.classList.remove("hidden");
            adminTab.classList.add("hidden");
            userFilter.classList.remove("hidden");
            adminFilter.classList.add("hidden");

            tabUser.classList.add("bg-green-600", "text-white");
            tabAdmin.classList.remove("bg-green-600", "text-white");
        });
    </script>
</x-app-layout>
