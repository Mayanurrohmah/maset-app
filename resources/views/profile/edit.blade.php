<x-app-layout>
    <x-slot name="header">
         <div class="min-h-[85vh] bg-gradient-to-br from-lime-100 via-emerald-100 to-lime-200 pt-20 pb-10">
            {{ __('Profile') }}
        </h2>
    </x-slot>

    
        <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
          <div class="min-h-[85vh] bg-gradient-to-br from-lime-100 via-emerald-100 to-lime-200 pt-20 pb-10">   <div class="grid grid-cols-1 md:grid-cols-3 gap-6">

                {{-- Sidebar Profil --}}
                <div class="p-6 bg-white dark:bg-gray-800 rounded-lg shadow text-center relative">
                    {{-- Form for Photo Upload --}}
                    {{-- This form handles only photo upload to prevent validation issues with other fields --}}
                    <form id="profile-photo-form" method="POST" action="{{ route('profile.update') }}" enctype="multipart/form-data">
                        @csrf
                        @method('PATCH')
                        {{-- Include current user's name and email as hidden inputs for validation --}}
                        <input type="hidden" name="name" value="{{ $user->name }}">
                        <input type="hidden" name="email" value="{{ $user->email }}">

                        <div class="relative inline-block group">
                            <img
                                class="h-32 w-32 mx-auto rounded-full object-cover border-4 border-purple-300 dark:border-purple-600 shadow-lg transition-transform duration-300 group-hover:scale-105"
                                src="{{ $user->photo ? asset('storage/' . $user->photo) : 'https://placehold.co/160x160/EEE/666?text=Avatar' }}"
                                alt="Avatar"
                                onerror="this.onerror=null;this.src='https://placehold.co/160x160/EEE/666?text=Avatar';"
                            />

                            {{-- Edit Icon --}}
                            <label for="photo_upload" class="absolute bottom-1 right-1 h-8 w-8 bg-white dark:bg-gray-700 border-2 border-purple-300 dark:border-purple-600 rounded-full flex items-center justify-center cursor-pointer shadow-md transition-all duration-300 hover:bg-purple-100 dark:hover:bg-purple-800">
                                <svg class="w-5 h-5 text-purple-600 dark:text-purple-300" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z"></path>
                                </svg>
                                <input
                                    type="file"
                                    name="photo"
                                    id="photo_upload"
                                    class="hidden" {{-- Hide the actual file input --}}
                                    onchange="document.getElementById('profile-photo-form').submit();" {{-- Auto submit on file select --}}
                                />
                            </label>
                            {{-- Optional: Online Status Indicator for Profile Page (If you want it here too) --}}
                            {{-- @if($user->status == 'online')
                                <span class="absolute bottom-2 right-10 h-4 w-4 rounded-full bg-green-500 border-2 border-white dark:border-gray-800 animate-pulse"></span>
                            @endif --}}
                        </div>
                    </form>

                    <h3 class="mt-4 text-xl font-bold text-gray-800 dark:text-white">{{ $user->name }}</h3>
                    <p class="text-sm text-gray-500 dark:text-gray-400 mt-1">Bergabung sejak {{ $user->created_at->translatedFormat('d F Y') }}</p>
                </div>

                {{-- Form Utama (for Username, Email, Password) --}}
                <div class="md:col-span-2 p-6 bg-white dark:bg-gray-800 rounded-lg shadow">

                    {{-- ALERT: Success --}}
                    @if (session('success'))
                        <div
                            x-data="{ show: true }"
                            x-init="setTimeout(() => show = false, 4000)"
                            x-show="show"
                            x-transition
                            class="mb-4 flex items-center gap-3 bg-green-100 border border-green-400 text-green-800 px-4 py-3 rounded shadow"
                        >
                            <svg class="w-5 h-5 text-green-600" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.707l-4 4a1 1 0 01-1.414 0l-2-2a1 1 0 111.414-1.414L9 10.586l3.293-3.293a1 1 0 111.414 1.414z" />
                            </svg>
                            <span>{{ session('success') }}</span>
                        </div>
                    @endif

                    {{-- ALERT: Error (for general form fields, not specifically photo upload) --}}
                    @if ($errors->any() && !$errors->has('photo'))
                        <div class="mb-4 bg-red-100 border border-red-400 text-red-800 px-4 py-3 rounded shadow">
                            <ul class="list-disc pl-5 space-y-1">
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif
                    {{-- ALERT: Photo Specific Error --}}
                    @if ($errors->has('photo'))
                        <div class="mb-4 bg-red-100 border border-red-400 text-red-800 px-4 py-3 rounded shadow">
                            <ul class="list-disc pl-5 space-y-1">
                                <li>{{ $errors->first('photo') }}</li>
                            </ul>
                        </div>
                    @endif


                    <form method="POST" action="{{ route('profile.update') }}">
                        @csrf
                        @method('PATCH')

                        {{-- Nama dan Email --}}
                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-6">
                            <div>
                                <x-input-label for="name" value="Username" />
                                <x-text-input id="name" name="name" type="text"
                                    class="mt-1 w-full bg-gray-100 dark:bg-gray-700 border border-gray-300 dark:border-gray-600 text-gray-800 dark:text-white rounded-md focus:ring-purple-500"
                                    value="{{ old('name', $user->name) }}" required />
                                <x-input-error class="mt-2" :messages="$errors->get('name')" />
                            </div>
                            <div>
                                <x-input-label for="email" value="Email" />
                                <x-text-input id="email" name="email" type="email"
                                    class="mt-1 w-full bg-gray-100 dark:bg-gray-700 border border-gray-300 dark:border-gray-600 text-gray-800 dark:text-white rounded-md focus:ring-purple-500"
                                    value="{{ old('email', $user->email) }}" required />
                                <x-input-error class="mt-2" :messages="$errors->get('email')" />
                            </div>
                        </div>

                        {{-- Password --}}
                        <div class="mt-6">
                            <div class="mb-4">
                                <x-input-label for="current_password" value="Current Password" />
                                <x-text-input id="current_password" name="current_password" type="password"
                                    class="mt-1 w-full bg-gray-100 dark:bg-gray-700 border border-gray-300 dark:border-gray-600 text-gray-800 dark:text-white rounded-md focus:ring-purple-500" />
                                <x-input-error class="mt-2" :messages="$errors->get('current_password')" />
                            </div>

                            <div class="mb-4">
                                <x-input-label for="password" value="New Password" />
                                <x-text-input id="password" name="password" type="password"
                                    class="mt-1 w-full bg-gray-100 dark:bg-gray-700 border border-gray-300 dark:border-gray-600 text-gray-800 dark:text-white rounded-md focus:ring-purple-500" />
                                <x-input-error class="mt-2" :messages="$errors->get('password')" />
                            </div>

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