<x-app-layout>
    <div class="max-w-7xl mx-auto px-4 py-6">
        <!-- Filters & Search -->
        <div class="flex flex-col md:flex-row justify-between items-center gap-4 mb-6">
            <div class="flex gap-2">
                <button class="border rounded-full px-4 py-2 text-sm hover:bg-gray-100">Filters</button>
                <button class="border rounded-full px-4 py-2 text-sm hover:bg-gray-100">My Food</button>
                <button class="border rounded-full px-4 py-2 text-sm hover:bg-gray-100">My Collections</button>
            </div>
            <input type="text" placeholder="Search Foods..." class="border px-4 py-2 rounded-md w-full md:w-1/3">
        </div>

        <!-- Results -->
        <h2 class="text-xl font-semibold mb-4">Results</h2>

        <!-- Food Grid -->
        <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-6">
            <!-- Food Card -->
            <div class="text-center">
                <img src="https://via.placeholder.com/150" alt="Egg" class="rounded-md mb-2 w-full h-28 object-cover">
                <h3 class="text-sm font-semibold text-blue-800">Easy Hard-Boiled Eggs</h3>
                <p class="text-xs text-gray-500 flex justify-center items-center gap-1">
                    <span class="w-2 h-2 rounded-full bg-purple-400"></span> 72 Calories
                </p>
            </div>

            <div class="text-center">
                <img src="https://via.placeholder.com/150" alt="Chicken Caesar" class="rounded-md mb-2 w-full h-28 object-cover">
                <h3 class="text-sm font-semibold text-blue-800">Chicken Caesar Salad</h3>
                <p class="text-xs text-gray-500 flex justify-center items-center gap-1">
                    <span class="w-2 h-2 rounded-full bg-purple-400"></span> 358 Calories
                </p>
            </div>

            <div class="text-center">
                <img src="https://via.placeholder.com/150" alt="Spinach Scramble" class="rounded-md mb-2 w-full h-28 object-cover">
                <h3 class="text-sm font-semibold text-blue-800">Simple Spinach Scramble</h3>
                <p class="text-xs text-gray-500 flex justify-center items-center gap-1">
                    <span class="w-2 h-2 rounded-full bg-purple-400"></span> 252 Calories
                </p>
            </div>

            <div class="text-center">
                <img src="https://via.placeholder.com/150" alt="Scrambled Eggs" class="rounded-md mb-2 w-full h-28 object-cover">
                <h3 class="text-sm font-semibold text-blue-800">Basic Scrambled Eggs</h3>
                <p class="text-xs text-gray-500 flex justify-center items-center gap-1">
                    <span class="w-2 h-2 rounded-full bg-purple-400"></span> 273 Calories
                </p>
            </div>

            <div class="text-center">
                <img src="https://via.placeholder.com/150" alt="Chicken Teriyaki" class="rounded-md mb-2 w-full h-28 object-cover">
                <h3 class="text-sm font-semibold text-blue-800">Easy Grilled Chicken Teriyaki</h3>
                <p class="text-xs text-gray-500 flex justify-center items-center gap-1">
                    <span class="w-2 h-2 rounded-full bg-purple-400"></span> 373 Calories
                </p>
            </div>

            <!-- Add more food cards as needed... -->

        </div>
    </div>
</x-app-layout>
