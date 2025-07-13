<x-app-layout>
    <div class="p-6 bg-white max-w-2xl mx-auto">
        <h2 class="text-xl font-bold mb-4">Import Data Makanan</h2>

        @if(session('success'))
            <div class="bg-green-100 text-green-700 px-4 py-2 rounded mb-4">{{ session('success') }}</div>
        @endif

        <form action="{{ route('makanan.import.store') }}" method="POST" enctype="multipart/form-data">
            @csrf

            <div class="mb-4">
                <label class="block font-semibold mb-1">Pilih File CSV</label>
                <input type="file" name="file" required class="border p-2 rounded w-full">
            </div>

            <button class="bg-lime-500 hover:bg-lime-600 text-white px-4 py-2 rounded">Import</button>
        </form>
    </div>
</x-app-layout>
