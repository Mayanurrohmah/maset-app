<x-app-layout>
    <div class="max-w-7xl mx-auto py-10 px-4">
        <!-- Wrapper with white background -->
        <div class="bg-white rounded-lg shadow-lg p-6">
            <h2 class="text-3xl font-bold text-center text-lime-700 mb-6">Data Pengguna</h2>

            @if(session('success'))
            <div class="bg-green-100 border border-green-300 text-green-800 px-4 py-3 rounded mb-6">
                {{ session('success') }}
            </div>
            @endif

            <div class="flex flex-wrap items-center justify-between space-y-4 md:space-y-0 pb-4">
                <form action="{{ route('auth.user_pengguna') }}" method="GET" id="filterUserForm" class="flex flex-col sm:flex-row items-center gap-2 w-full sm:w-auto">

                    {{-- Dropdown Filter Role --}}
                    @php
                    $current_role = request('role', 'all'); // ''|user|admin
                    $label_role = $current_role === 'all' ? 'Semua Role' : ucfirst($current_role);
                    @endphp
                    {{-- Dropdown Filter Role --}}
                    <div>
                        <button id="dropdownRadioButton" data-dropdown-toggle="dropdownRadio" type="button"
                            class="w-full sm:w-auto inline-flex items-center text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 focus:ring-4 focus:ring-gray-100 font-medium rounded-lg text-sm px-3 py-2">
                            <i class="fas fa-filter w-3 h-3 text-gray-500 me-3"></i>
                            <span id="filter-label">{{ $label_role }}</span>
                            <svg class="w-2.5 h-2.5 ms-2.5" aria-hidden="true" fill="none" viewBox="0 0 10 6">
                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4" />
                            </svg>
                        </button>

                        <div id="dropdownRadio" class="z-10 hidden w-48 bg-white divide-y divide-gray-100 rounded-lg shadow">
                            <ul class="p-3 space-y-1 text-sm text-gray-700" aria-labelledby="dropdownRadioButton">
                                @foreach([['Semua','all'], ['User','user'], ['Admin','admin']] as [$label,$value])
                                <li>
                                    <label class="flex items-center p-2 rounded hover:bg-gray-100 cursor-pointer">
                                        <input type="radio" name="role" value="{{ $value }}"
                                            class="w-4 h-4 text-lime-600 bg-gray-100 border-gray-300 focus:ring-lime-500"
                                            {{ $current_role === $value ? 'checked' : '' }}>
                                        <span class="ms-2 text-sm font-medium text-gray-900">{{ $label }}</span>
                                    </label>
                                </li>
                                @endforeach
                            </ul>
                        </div>
                    </div>

                    {{-- Input Pencarian --}}
                    <div class="relative w-full sm:w-auto">
                        <div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
                            <i class="fas fa-search text-gray-500"></i>
                        </div>
                        <input type="text"
                            id="table-search-user"
                            name="search"
                            value="{{ request('search') }}"
                            placeholder="Cari nama/email/role"
                            class="block p-2 ps-10 text-sm text-gray-900 border border-gray-300 rounded-lg w-full sm:w-80 bg-gray-50 focus:ring-lime-500 focus:border-lime-500">
                    </div>

                    {{-- Tombol submit (opsional, Enter juga bisa) --}}
                    <!-- <button type="submit"
                    class="bg-lime-600 hover:bg-lime-700 text-white font-semibold px-4 py-2 rounded-lg transition">
                    Terapkan
                </button> -->
                </form>
            </div>


            <!-- Table -->
            <div class="overflow-x-auto">
                <table class="min-w-full text-sm text-left text-gray-700">
                    <thead class="bg-lime-100 text-gray-800 uppercase text-xs">
                        <tr>
                            <th class="px-6 py-3">No</th>
                            <th class="px-6 py-3">Profil</th>
                            <th class="px-6 py-3">Nama</th>
                            <th class="px-6 py-3">Email</th>
                            <th class="px-6 py-3">Role</th>
                            <th class="px-6 py-3">Bergabung</th>
                            <th class="px-6 py-3">Aktivitas</th>
                            <th class="px-6 py-3 text-center">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($users as $index => $user)
                        <tr class="hover:bg-gray-50 border-b transition duration-200">
                            <td class="px-6 py-4 font-semibold text-gray-700">{{ $index + 1 }}</td>
                            <td class="px-6 py-4">
                                <img
                                    src="{{ $user->photo ? asset('storage/' . $user->photo) : 'https://placehold.co/40x40/EEE/666?text=U' }}"
                                    alt="{{ $user->name ?? 'User' }} Avatar"
                                    class="w-10 h-10 rounded-full object-cover border border-gray-200"
                                    onerror="this.onerror=null;this.src='https://placehold.co/40x40/EEE/666?text=U';" />
                            </td>
                            <td class="px-6 py-4">{{ $user->name }}</td>
                            <td class="px-6 py-4">{{ $user->email }}</td>
                            <td class="px-6 py-4">{{ $user->role }}</td>

                            <td class="px-6 py-4 text-gray-600">{{ $user->created_at->format('d M Y') }}</td>
                            <td class="px-6 py-4 text-center">
                                <a href="{{ route('admin.user_activity', $user->id) }}"
                                    class="inline-flex items-center px-3 py-1 bg-lime-600 text-white text-xs font-medium rounded hover:bg-lime-700 transition"
                                    title="Lihat Aktivitas">
                                    <i class="fas fa-list mr-1"></i> Aktivitas
                                </a>
                            </td>

                            <td class="px-6 py-4 text-center space-x-2">
                                <a href="{{ route('auth.user_pengguna.edit', $user->id) }}" class="text-blue-600 hover:text-blue-800" title="Edit">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <form action="{{ route('auth.user_pengguna.hapus', $user->id) }}" method="POST" class="inline" onsubmit="return confirm('Yakin hapus pengguna ini?')">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="text-red-600 hover:text-red-800" title="Hapus">
                                        <i class="fas fa-trash-alt"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="7" class="text-center py-6 text-gray-500">Tidak ada data pengguna.</td>
                        </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
            <!-- {{ $users->links() }} -->
            {{-- Paginasi --}}
            <nav class="flex items-center justify-between pt-4" aria-label="Table navigation">
                {{ $users->appends(request()->query())->links() }}
            </nav>
        </div>
    </div>

    {{-- Auto-submit saat role diganti + update label --}}
    <script>
        (function() {
            const form = document.getElementById('filterUserForm');
            const label = document.getElementById('filter-label');
            const radios = form.querySelectorAll('input[name="role"]');
            const toggleBtn = document.getElementById('dropdownRadioButton'); // Flowbite toggle

            radios.forEach(r => {
                r.addEventListener('change', () => {
                    // Update label pada tombol
                    label.textContent = (r.value === 'all') ?
                        'Semua Role' :
                        r.value.charAt(0).toUpperCase() + r.value.slice(1);

                    // Tutup dropdown (toggle lagi)
                    if (toggleBtn) toggleBtn.click();

                    // Submit form otomatis
                    form.submit();
                });
            });
        })();
    </script>
</x-app-layout>