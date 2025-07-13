<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProfileUpdateRequest;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\View\View;

class ProfileController extends Controller
{
    /**
     * Tampilkan halaman edit profil.
     */
    public function edit(Request $request): View
    {
        return view('profile.edit', [
            'user' => $request->user(),
        ]);
    }

    /**
     * Update informasi profil pengguna.
     */
    public function update(ProfileUpdateRequest $request): RedirectResponse
    {
        $user = $request->user();
        $validated = $request->validated();

        // Perbarui nama & email
        $user->name = $validated['name'];
        $user->email = $validated['email'];

        // Cek apakah ada update password
        $passwordUpdated = false;
        if ($request->filled('password')) {
            if (!Hash::check($request->input('current_password'), $user->password)) {
                return Redirect::back()
                    ->withErrors(['current_password' => 'Password lama tidak sesuai.'])
                    ->withInput();
            }

            $user->password = bcrypt($request->input('password'));
            $passwordUpdated = true;
        }

        // Update foto jika ada
        if ($request->hasFile('photo')) {
            // Hapus foto lama jika ada
            if ($user->photo) {
                Storage::disk('public')->delete($user->photo);
            }

            // Simpan foto baru
            $user->photo = $request->file('photo')->store('profile-photos', 'public');
        }

        // Jika email berubah, verifikasi ulang
        if ($user->isDirty('email')) {
            $user->email_verified_at = null;
        }

        $user->save();

        return Redirect::route('profile.edit')->with(
            'success',
            $passwordUpdated ? 'password-updated' : 'Profil berhasil diperbarui.'
        );
    }

    /**
     * Hapus foto profil pengguna.
     */
    public function deletePhoto(Request $request): RedirectResponse
    {
        $user = $request->user();

        if ($user->photo) {
            Storage::disk('public')->delete($user->photo);
            $user->photo = null;
            $user->save();
        }

        return Redirect::route('profile.edit')->with('success', 'Foto profil berhasil dihapus.');
    }
}
