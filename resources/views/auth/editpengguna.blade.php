<x-app-layout>
    <div class="max-w-2xl mx-auto mt-10 bg-white p-8 rounded-2xl shadow-md">
        <h2 class="text-2xl font-bold text-center text-lime-700 mb-6">Edit Pengguna</h2>

        <form method="POST" action="{{ route('auth.user_pengguna.update', $user->id) }}">
            @csrf
            @method('PUT')

            <div class="mb-5">
                <label for="name" class="block text-gray-700 font-medium mb-1">Nama</label>
                <input type="text" name="name" id="name"
                       value="{{ old('name', $user->name) }}" required
                       class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-lime-400 focus:outline-none">
            </div>

            <div class="mb-5">
                <label for="email" class="block text-gray-700 font-medium mb-1">Email</label>
                <input type="email" name="email" id="email"
                       value="{{ old('email', $user->email) }}" required
                       class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-lime-400 focus:outline-none">
            </div>

            <div class="mb-6">
                <label for="role" class="block text-gray-700 font-medium mb-1">Role</label>
                <select name="role" id="role" required
                        class="w-full px-4 py-2 border rounded-lg bg-white focus:ring-2 focus:ring-lime-400 focus:outline-none">
                    <option value="user" {{ $user->role === 'user' ? 'selected' : '' }}>User</option>
                    <option value="admin" {{ $user->role === 'admin' ? 'selected' : '' }}>Admin</option>
                </select>
            </div>

            <div class="flex justify-between items-center">
                <a href="{{ route('auth.user_pengguna') }}"
                   class="text-sm text-gray-600 hover:underline">
                    ← Kembali
                </a>

                <button type="submit"
                        class="bg-lime-600 hover:bg-lime-700 text-white font-semibold px-5 py-2 rounded-lg transition duration-200">
                    Simpan
                </button>
            </div>
        </form>
    </div>
</x-app-layout>
