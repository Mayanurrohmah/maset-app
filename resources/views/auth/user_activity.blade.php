<x-app-layout>
    <table class="table-auto w-full border border-black text-left">
        <thead class="bg-gray-100">
            <tr>
                <th class="border px-4 py-2">No</th>
                <th class="border px-4 py-2">Username</th>
                <th class="border px-4 py-2">Tanggal & Waktu</th>
                <th class="border px-4 py-2">Aksi Dilakukan</th>
            </tr>
        </thead>
        <tbody>
            @foreach($log as $index => $aktivitas)
            <tr>
                <td class="border px-4 py-2">{{ $index + 1 }}</td>
                <td class="border px-4 py-2">{{ $aktivitas->user->name }}</td>
                <td class="border px-4 py-2">{{ $aktivitas->created_at }}</td>
                <td class="border px-4 py-2">{{ $aktivitas->aksi }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>
</x-app-layout>