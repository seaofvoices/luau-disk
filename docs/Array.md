# Array

In this section, you will find multiple functions to work with arrays (or lists if you prefer).

In your code, it is encouraged to put this part of the library into a variable:

```lua
local Array = Disk.Array
```

If you are not familiar with this kind of utility functions, don't get overwhelmed and start with these:

- [map](#map)
- [filter](#filter)
- [concat](#concat)
- [pop](#pop)
- [push](#push)

Once you feel comfortable, you may want to take a look at these:

- [flatMap](#flatMap)
- [all](#all) and [any](#any)
- [reduce](#reduce)

## all

Verify if all elements in an array satisfy a certain condition expressed with a function.

As soon as one element **does not** satisfy the condition, the condition will not be verified for the rest of the elements.

```lua
-- result is true because the function will return true for ALL elements
local areAbove5 = Array.all({30, 6, 8, 10}, function(value: number)
	return value > 5
end)

-- result is false because the function will return false for 6
local areAbove5 = Array.all({30, 6, 8, 10}, function(value: number)
	return value > 7
end)

-- result is always true when the array is empty
local areAbove5 = Array.all({}, function(value: number)
	return value > 5
end)
```

*Related: [any](#any)*

## alternate

Creates a new array from multiple arrays, where the elements are taken one by one into each of the provided array.

```lua
local result = alternate({ 2, 4 }, { 'a', 'b' }) --> { 2, 'a', 4, 'b' }
```

## any

Verify that at least one element of the array satisfy a certain condition.

As soon as an element satisfies the condition, the condition will not be verified on the rest of the elements.

```lua
-- result is true because the function will return true for 8
local areAbove5 = Array.all({3, 7, 8, 3}, function(value: number)
	return value == 8
end)

-- result is false because the function will return false for 6
local areAbove5 = Array.all({30, 6, 8, 10}, function(value: number)
	return value > 7
end)

-- result is always false when the array is empty
local areAbove5 = Array.all({}, function(value: number)
	return value > 5
end)
```

*Related: [all](#all)*

## average

Calculates the average value from an array of numbers.

```lua
local result = Array.average({4, 6, 8, 8}) --> 6.5
```

*Related: [averageBy](#averageBy)*

## averageBy

Calculates the average value of an array given a mapping function that produces numbers.

```lua
local result = Array.average({"hello", " ", "world", "!"}, function(value)
    return string.len(value)
end)
-- result is 4
```

*Related: [average](#average)*

## concat

Takes multiple arrays and concat (chain) them into a single array.

```lua
local result = Array.concat({ 1, 2 }, { 3, 4 }) -- { 1, 2, 3, 4 }

local result = Array.concat({ "start" }, { 1, 3, 5 }, { "end" })
--    result = { "start", 1, 3, 5, "end" }
```

## copy

Makes a **shallow** copy of an array.

## filter

Creates an array from only elements that satisfy a condition.

```lua
-- result is { 7, 9 }
local above5 = Array.filter({ 3, 7, 4, 9 }, function(element)
    return element > 5
end)
```

## find

*Todo*

## findIndex

*Todo*

## findIndexByValue

*Todo*

## findMap

*Todo*

## flatMap

*Todo*

## flatten

*Todo*

## fromFn

*Todo*

## isArray

Given any value, returns `true` or `false` if it is an array.

```lua
local result = Array.isArray({ 'Bobby', 'Claudio' }) -- true

-- an array with different value types is still an array!
local result = Array.isArray({ 5, 'Claudio', false, function() end }) -- true

-- a dictionary is not an array!
local result = Array.isArray({ initialValue = 0 }) -- false

-- an empty table is an array
local result = Array.isArray({}) -- true
```

## isEmpty

Given an array, returns `true` if it has no elements.

## map

*Todo*

Related [flatMap]([#flatMap)

## maximum

Given an array of number, returns the largest value of the array. An initial value has to be provided if the array is empty.

```lua
local result = Array.maximum({8, 6, 16, 4}) -- result is 16

-- the initial value may be return if it is the largest value
local result = Array.maximum({25, 5}, 100) -- result is 100
```

**Note:** if the array is empty, the initial value will be returned.

*Related [maximumBy](#maximumBy), [minimum](#minimum), [minimumBy](#minimumBy)*

## maximumBy

Given an array and a mapping function that produces numbers, returns the largest value produced. An initial value has to be provided if the array is empty.

```lua
local result = Array.maximumBy({"hello", "bye", "good morning"}, function(value)
    return string.len(value)
end)
-- result is 12
```

*Related [maximum](#maximum), [minimum](#minimum), [minimumBy](#minimumBy)*

## minimum

Given an array of number, returns the smallest value of the array. An initial value has to be provided if the array is empty.

```lua
local result = Array.minimum({8, 6, 2, 4}, math.huge) -- result is 2

-- the initial value may be return if it is the smallest value
local result = Array.minimum({250, 500}, 10) -- result is 10
```

**Note:** if the array is empty, the initial value will be returned.

*Related [minimumBy](#minimumBy), [maximum](#maximum), [maximumBy](#maximumBy)*

## minimumBy

Given an array and a mapping function that produces numbers, returns the smallest value produced. An initial value has to be provided if the array is empty.

```lua
local result = Array.minimumBy({"hello", "bye", "good morning"}, function(value)
    return string.len(value)
end)
-- result is 12
```

*Related [minimum](#minimum), [maximum](#maximum), [maximumBy](#maximumBy)*

## partition

*Todo*

## pop

Remove one (or many) elements from the end of the array.

*Related [popFirst](#popFirst), [range](#range)*

## popFirst

Remove one (or many) elements from the start of the array.

*Related [pop](#pop), [range](#range)*

## product

*Related [productBy](#productBy), [sum](#sum), [sumBy](#sumBy)*

## productby

*Related [product](#product), [sum](#sum), [sumBy](#sumBy)*

## push

Add element(s) at the end of the array

## range

*Todo*

*Related [pop](#pop), [popFirst](#popFirst)*

## reduce

*Todo*

## reversed

Create a new array but with the element in reverse order. For an array of less than 2 elements, this function will return the same array.

```lua
local result = Array.reversed({ 1, 2, 3 }) --> { 3, 2, 1 }
```

## sort

For a given array, the function returns a new one with its element sorted.

An optional comparator function can be provided to customize how the elements are compared.

For an array of less than 2 elements, this function will return the same array.

*Related [sortByKey](#sortByKey)*

## sortByKey

*Related [sort](#sort)*

## zip

*Todo*

## sum

*Todo*

*Related [sumBy](#sumBy), [product](#product), [productBy](#productBy)*

## sumBy

*Todo*

*Related [sum](#sum), [product](#product), [productBy](#productBy)*
