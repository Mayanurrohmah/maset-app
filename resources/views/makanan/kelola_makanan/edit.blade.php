<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-700 dark:text-gray-100 leading-tight">
            {{ __('Profile') }}
        </h2>
    </x-slot>

    <div class="py-12 bg-gradient-to-br from-green-50 via-white to-green-100 dark:from-gray-900 dark:via-gray-800 dark:to-gray-900 min-h-screen text-gray-800 dark:text-gray-200">
        <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">

                {{-- Sidebar Profil di Halaman Edit --}}
                <div class="p-6 bg-white dark:bg-gray-800 rounded-lg shadow text-center">
                    <img
                        class="h-32 w-32 mx-auto rounded-full object-cover border-4 border-purple-300 dark:border-purple-600 shadow"
                        src="{{ $user->photo ? asset('storage/' . $user->photo) : asset('images/default_profile.jpg') }}" {{-- Updated default fallback --}}
                        alt="Avatar"
                        onerror="this.onerror=null;this.src='{{ asset('images/default_profile.jpg') }}';" {{-- Updated onerror fallback --}}
                    />
                    <h3 class="mt-4 text-xl font-bold text-gray-800 dark:text-white">{{ $user->name }}</h3>
                    <p class="text-sm text-gray-500 dark:text-gray-400 mt-4">Edit your personal info and credentials here.</p>
                </div>

                {{-- Form Utama --}}
                <div class="md:col-span-2 p-6 bg-white dark:bg-gray-800 rounded-lg shadow">

                    {{-- Toast Notification --}}
                    <div
                        x-data="{ show: true }"
                        x-show="show"
                        x-transition
                        x-init="setTimeout(() => show = false, 4000)"
                        class="mb-6"
                    >
                        @if (session('success'))
                            <div class="px-4 py-3 rounded-md bg-green-100 dark:bg-green-800 border border-green-400 dark:border-green-600 text-green-900 dark:text-green-100 shadow-md">
                                {{ session('success') }}
                            </div>
                        @elseif (session('error'))
                            <div class="px-4 py-3 rounded-md bg-red-100 dark:bg-red-800 border border-red-400 dark:border-red-600 text-red-900 dark:text-red-100 shadow-md">
                                {{ session('error') }}
                            </div>
                        @endif
                    </div>

                    <form method="POST" action="{{ route('profile.update') }}" enctype="multipart/form-data">
                        @csrf
                        @method('PATCH')

                        {{-- Bagian Nama & Email --}}
                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-6">
                            {{-- Username --}}
                            <div>
                                <x-input-label for="name" value="Username" />
                                <x-text-input id="name" name="name" type="text"
                                    class="mt-1 w-full bg-gray-100 dark:bg-gray-700 border border-gray-300 dark:border-gray-600 text-gray-800 dark:text-white rounded-md focus:ring-purple-500"
                                    value="{{ old('name', $user->name) }}" required />
                                <x-input-error class="mt-2" :messages="$errors->get('name')" />
                            </div>

                            {{-- Email --}}
                            <div>
                                <x-input-label for="email" value="Email" />
                                <x-text-input id="email" name="email" type="email"
                                    class="mt-1 w-full bg-gray-100 dark:bg-gray-700 border border-gray-300 dark:border-gray-600 text-gray-800 dark:text-white rounded-md focus:ring-purple-500"
                                    value="{{ old('email', $user->email) }}" required />
                                <x-input-error class="mt-2" :messages="$errors->get('email')" />
                            </div>
                        </div>

                        {{-- Input untuk Upload Foto --}}
                        <div class="mt-6">
                            <x-input-label for="photo" value="Profile Photo" />
                            <input id="photo" name="photo" type="file" class="mt-1 block w-full text-sm text-gray-500
                                file:mr-4 file:py-2 file:px-4
                                file:rounded-full file:border-0
                                file:text-sm file:font-semibold
                                file:bg-purple-50 file:text-purple-700
                                hover:file:bg-purple-100"/>
                            <x-input-error class="mt-2" :messages="$errors->get('photo')" />

                            @if ($user->photo)
                                <div class="mt-2 text-sm text-gray-600 dark:text-gray-400">
                                    Current photo: <a href="{{ asset('storage/' . $user->photo) }}" target="_blank" class="text-purple-500 hover:underline">View Photo</a>
                                    <form action="{{ route('profile.deletePhoto') }}" method="POST" class="inline-block ml-4">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="text-red-500 hover:underline" onclick="return confirm('Are you sure you want to delete your profile photo?');">
                                            Delete Photo
                                        </button>
                                    </form>
                                </div>
                            @endif
                        </div>


                        {{-- Bagian Password --}}
                        <div class="mt-6">
                            {{-- Current Password --}}
                            <div class="mb-4">
                                <x-input-label for="current_password" value="Current Password" />
                                <x-text-input id="current_password" name="current_password" type="password"
                                    class="mt-1 w-full bg-gray-100 dark:bg-gray-700 border border-gray-300 dark:border-gray-600 text-gray-800 dark:text-white rounded-md focus:ring-purple-500" />
                                <x-input-error class="mt-2" :messages="$errors->get('current_password')" />
                            </div>

                            {{-- New Password --}}
                            <div class="mb-4">
                                <x-input-label for="password" value="New Password" />
                                <x-text-input id="password" name="password" type="password"
                                    class="mt-1 w-full bg-gray-100 dark:bg-gray-700 border border-gray-300 dark:border-gray-600 text-gray-800 dark:text-white rounded-md focus:ring-purple-500" />
                                <x-input-error class="mt-2" :messages="$errors->get('password')" />
                            </div>

                            {{-- Confirm Password --}}
                            <div>
                                <x-input-label for="password_confirmation" value="Confirm Password" />
                                <x-text-input id="password_confirmation" name="password_confirmation" type="password"
                                    class="mt-1 w-full bg-gray-100 dark:bg-gray-700 border border-gray-300 dark:border-gray-600 text-gray-800 dark:text-white rounded-md focus:ring-purple-500" />
                                <x-input-error class="mt-2" :messages="$errors->get('password_confirmation')" />
                            </div>
                        </div>

                        {{-- Tombol Simpan --}}
                        <div class="mt-6">
                            <x-primary-button class="px-6 py-3 bg-purple-500 hover:bg-purple-600 text-white font-semibold rounded-lg shadow transition duration-300">
                                Simpan Perubahan
                            </x-primary-button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</x-app-layout>