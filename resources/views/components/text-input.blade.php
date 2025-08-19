@props(['disabled' => false])

<input {{ $disabled ? 'disabled' : '' }} {!! $attributes->merge([
'class' =>
'bg-white text-gray-900 border border-gray-200 rounded-xl
px-4 py-3 text-[15px] leading-6 shadow-sm
focus:ring-2 focus:ring-lime-500/60 focus:border-lime-500
disabled:bg-gray-100 disabled:text-gray-400 disabled:cursor-not-allowed
[ &:-webkit-autofill ]:shadow-[inset_0_0_0_1000px_#fff]'
]) !!}>