<x-app-layout>
    <div class="max-w-7xl mx-auto py-10 px-4">
        <div class="bg-white rounded-lg shadow p-6">
            <h2 class="text-2xl font-semibold text-gray-700 mb-4">Aktivitas: {{ $user->name }}</h2>

            @if($aktivitas->isEmpty())
            <p class="text-gray-500">Belum ada aktivitas yang tercatat.</p>
            @else
            <ul class="divide-y divide-gray-200">
                @foreach($aktivitas as $log)
                <li class="py-3">
                    <div class="text-sm text-gray-700">{{ $log->aksi }}</div>
                    <div class="text-xs text-gray-400">{{ $log->created_at }}</div>
                </li>
                @endforeach
            </ul>

            <!-- Pagination -->
            <div class="mt-6">
                {{ $aktivitas->links() }}
            </div>
            @endif
        </div>
    </div>
</x-app-layout>