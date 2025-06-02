<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>

 <div class="max-w-4xl mx-auto p-6">
        <h1 class="text-2xl font-bold mb-4">What do you like to eat?</h1>
        <p class="text-gray-600 mb-6">Choose from a primary diet type. You can exclude specific foods in the next step.</p>

        <form action="#" method="POST">
            @csrf

            <div class="space-y-4">
                @php
                    $options = [
                        ['label' => 'Anything', 'excludes' => 'Nothing'],
                        ['label' => 'Keto', 'excludes' => 'High-carb Grains, Refined Starches, Sugar'],
                        ['label' => 'Paleo', 'excludes' => 'Dairy, Grains, Legumes, Refined Starches, Soy, Sugar'],
                        ['label' => 'Vegan', 'excludes' => 'Red Meat, Poultry, Fish, Shellfish, Dairy, Eggs, Mayo, Honey'],
                        ['label' => 'Vegetarian', 'excludes' => 'Red Meat, Poultry, Fish, Shellfish']
                    ];
                @endphp

                @foreach ($options as $index => $option)
                <label class="flex items-start p-4 border rounded-lg hover:bg-gray-50 cursor-pointer">
                    <input type="radio" name="diet" value="{{ $option['label'] }}" class="mt-1 mr-4">
                    <div>
                        <p class="font-semibold">{{ $option['label'] }}</p>
                        <p class="text-sm text-gray-500">Excludes: {{ $option['excludes'] }}</p>
                    </div>
                </label>
                @endforeach
            </div>

            <div class="mt-6 flex justify-between items-center">
                <button type="submit" class="bg-orange-500 text-white px-5 py-2 rounded hover:bg-orange-600">Continue</button>
            </div>
        </form>
    </div>
</x-app-layout>
