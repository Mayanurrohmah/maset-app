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
                                        onerror="this.onerror=null;this.src='https://placehold.co/40x40/EEE/666?text=U';"
                                    />
                                </td>
                                <td class="px-6 py-4">{{ $user->name }}</td>
                                <td class="px-6 py-4">{{ $user->email }}</td>
                                <td class="px-6 py-4">
                                    <form action="{{ route('auth.user_pengguna.role', $user->id) }}" method="POST">
                                        @csrf
                                        <select name="role" onchange="this.form.submit()" class="border border-gray-300 text-sm rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-lime-300">
                                            <option value="user" {{ $user->role === 'user' ? 'selected' : '' }}>User</option>
                                            <option value="admin" {{ $user->role === 'admin' ? 'selected' : '' }}>Admin</option>
                                        </select>
                                    </form>
                                </td>
                                <td class="px-6 py-4 text-gray-600">{{ $user->created_at->format('d M Y') }}</td>
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
        </div>
    </div>
</x-app-layout>
