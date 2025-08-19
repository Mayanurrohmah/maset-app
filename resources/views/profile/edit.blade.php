<x-app-layout>
    <x-slot name="header">
        <div class="min-h-[85vh] bg-gradient-to-br from-lime-100 via-emerald-100 to-lime-200 pt-20 pb-10">
            {{ __('Profile') }}
        </div>
    </x-slot>

    <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="min-h-[85vh] bg-gradient-to-br from-lime-100 via-emerald-100 to-lime-200 pt-20 pb-10">
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">

                {{-- Sidebar Profil --}}
                <div class="p-6 bg-white rounded-lg shadow text-center relative">
                    <form id="profile-photo-form" method="POST" action="{{ route('profile.update') }}" enctype="multipart/form-data">
                        @csrf
                        @method('PATCH')
                        <input type="hidden" name="name" value="{{ $user->name }}">
                        <input type="hidden" name="email" value="{{ $user->email }}">

                        <div class="relative inline-block group">
                            <img
                                class="h-32 w-32 mx-auto rounded-full object-cover border-4 border-lime-300 shadow-lg transition-transform duration-300 group-hover:scale-105"
                                src="{{ $user->photo ? asset('storage/' . $user->photo) : 'https://placehold.co/160x160/EEE/666?text=Avatar' }}"
                                alt="Avatar"
                                onerror="this.onerror=null;this.src='https://placehold.co/160x160/EEE/666?text=Avatar';" />

                            {{-- Icon Edit --}}
                            <label for="photo_upload" class="absolute bottom-1 right-1 h-8 w-8 bg-white border-2 border-lime-300 rounded-full flex items-center justify-center cursor-pointer shadow-md hover:bg-lime-100 transition-all">
                                <svg class="w-5 h-5 text-lime-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z"></path>
                                </svg>
                                <input type="file" name="photo" id="photo_upload" class="hidden"
                                    onchange="document.getElementById('profile-photo-form').submit();" />
                            </label>
                        </div>
                    </form>

                    <h3 class="mt-4 text-xl font-bold text-gray-800">{{ $user->name }}</h3>
                    <p class="text-sm text-gray-500 mt-1">Bergabung sejak {{ $user->created_at->translatedFormat('d F Y') }}</p>
                </div>

                {{-- Form Utama --}}
                <div class="md:col-span-2 p-6 bg-white rounded-lg shadow">

                    {{-- ALERT: Success --}}
                    @if (session('success'))
                    <div class="mb-4 flex items-center gap-3 bg-green-100 border border-green-400 text-green-800 px-4 py-3 rounded shadow">
                        <svg class="w-5 h-5 text-green-600" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.707l-4 4a1 1 0 01-1.414 0l-2-2a1 1 0 111.414-1.414L9 10.586l3.293-3.293a1 1 0 111.414 1.414z" />
                        </svg>
                        <span>{{ session('success') }}</span>
                    </div>
                    @endif

                    {{-- ALERT: Error --}}
                    @if ($errors->any())
                    <div class="mb-4 bg-red-100 border border-red-400 text-red-800 px-4 py-3 rounded shadow">
                        <ul class="list-disc pl-5 space-y-1">
                            @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                    @endif

                    <form method="POST" action="{{ route('profile.update') }}">
                        @csrf
                        @method('PATCH')

                        {{-- Username & Email --}}
                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-6">
                            <div>
                                <x-input-label for="name" value="Username" />
                                <x-text-input id="name" name="name" type="text"
                                    class="mt-1 block w-full bg-white text-gray-900 border border-gray-200 rounded-xl
                                           px-4 py-3 text-[15px] leading-6 shadow-sm
                                           focus:ring-2 focus:ring-lime-500/60 focus:border-lime-500"
                                    value="{{ old('name', $user->name) }}" required />
                            </div>
                            <div>
                                <x-input-label for="email" value="Email" />
                                <x-text-input id="email" name="email" type="email"
                                    class="mt-1 block w-full bg-white text-gray-900 border border-gray-200 rounded-xl
                                           px-4 py-3 text-[15px] leading-6 shadow-sm
                                           focus:ring-2 focus:ring-lime-500/60 focus:border-lime-500"
                                    value="{{ old('email', $user->email) }}" required />
                            </div>
                        </div>

                        {{-- Password --}}
                        <div class="mt-6">
                            <div class="mb-4">
                                <x-input-label for="current_password" value="Current Password" />
                                <x-text-input id="current_password" name="current_password" type="password"
                                    class="mt-1 block w-full bg-white text-gray-900 border border-gray-200 rounded-xl
                                           px-4 py-3 text-[15px] leading-6 shadow-sm
                                           focus:ring-2 focus:ring-lime-500/60 focus:border-lime-500" />
                            </div>

                            <div class="mb-4">
                                <x-input-label for="password" value="New Password" />
                                <x-text-input id="password" name="password" type="password"
                                    class="mt-1 block w-full bg-white text-gray-900 border border-gray-200 rounded-xl
                                           px-4 py-3 text-[15px] leading-6 shadow-sm
                                           focus:ring-2 focus:ring-lime-500/60 focus:border-lime-500" />
                            </div>

                            <div>
                                <x-input-label for="password_confirmation" value="Confirm Password" />
                                <x-text-input id="password_confirmation" name="password_confirmation" type="password"
                                    class="mt-1 block w-full bg-white text-gray-900 border border-gray-200 rounded-xl
                                           px-4 py-3 text-[15px] leading-6 shadow-sm
                                           focus:ring-2 focus:ring-lime-500/60 focus:border-lime-500" />
                            </div>
                        </div>

                        {{-- Tombol --}}
                        <div class="mt-6">
                            <x-primary-button
                                class="px-6 py-3 bg-lime-500 hover:bg-lime-600 text-white font-semibold rounded-lg shadow transition duration-300">
                                Simpan Perubahan
                            </x-primary-button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</x-app-layout>