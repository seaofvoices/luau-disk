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
local result = Array.averageBy({"hello", " ", "world", "!"}, function(value)
    return string.len(value)
end)
-- result is 4
```

*Related: [average](#average)*

## contains

Verifies if an array contains a certain value.

```lua
local result = Array.contains({"hello", "world", "!"}, "!")
-- result is true
```

*Related: [find](#find), [findIndex](#findIndex), [findIndexByValue](#findIndexByValue), [findMap](#findMap)*

## concat

Takes multiple arrays and concat (chain) them into a single array.

```lua
local result = Array.concat({ 1, 2 }, { 3, 4 }) -- { 1, 2, 3, 4 }

local result = Array.concat({ "start" }, { 1, 3, 5 }, { "end" })
--    result = { "start", 1, 3, 5, "end" }
```

## copy

Makes a **shallow** copy of an array.

```lua
local value = { 3, 4 }
local result = Array.copy(value)

print(value == result) -- false
print(value[1] == result[1] and value[2] == result[2]) -- true
```

## deduplicate

Removes duplicate elements from an array.

```lua
local result = Array.deduplicate({1, 2, 3, 2, 4, 5, 3}) --> {1, 2, 3, 4, 5}
```

*Related: [deduplicateByKey](#deduplicateByKey)*

## deduplicateByKey

Removes duplicate elements from an array based on a mapping function. Instead of comparing each element with each other directly, they are compared using the value returned by the mapping function.

**Note:** the mapping function should never return `nil`.

```lua
local function getId(object)
	return object.id
end

local result = Array.deduplicateByKey({
    { id = 1, value = 'a' },
    { id = 2, value = 'b' },
    { id = 1, value = 'c' }, -- this element is removed because it has the same id
}, getId)
-- result is { { id = 1, value = 'a' }, { id = 2, value = 'b' } }
```

*Related: [deduplicate](#deduplicate)*

## filter

Creates an array from only elements that satisfy a condition.

```lua
-- result is { 7, 9 }
local above5 = Array.filter({ 3, 7, 4, 9 }, function(element)
    return element > 5
end)
```

*Related [partition](#partition)*

## find

Finds the first element in an array that satisfies a condition.

```lua
local result = Array.find({1, 2, 3, 4, 5}, function(value)
    return value % 2 == 0
end)
-- result is 2
```

*Related: [contains](#contains), [findIndex](#findIndex), [findIndexByValue](#findIndexByValue), [findMap](#findMap)*

## findIndex

Finds the index of the first element in an array that satisfies a condition.

```lua
local result = Array.findIndex({1, 7, 16, 5}, function(value)
    return value % 2 == 0
end)
-- result is 3
```

*Related: [find](#find), [findIndexByValue](#findIndexByValue), [findMap](#findMap)*

## findIndexByValue

Finds the index of the first occurrence of a value in an array.

```lua
local result = Array.findIndexByValue({ 'a', 'b', 'c', 'b', 'd' }, 'b')
-- result is 2
```

*Related: [find](#find), [findIndex](#findIndex), [findMap](#findMap)*

## findMap

Applies a mapping function to each element in an array and returns the first non-nil result.

```lua
local result = Array.findMap({ 'apple', 'banana', 'grape' }, function(fruit)
    if string.len(fruit) > 5 then
        return string.upper(fruit)
    else
        return nil
    end
end)
-- result is 'BANANA'
```

*Related: [find](#find), [findIndex](#findIndex), [findIndexByValue](#findIndexByValue)*

## flatMap

Maps each element of an array to a new array and then flattens the result into a single array.

```lua
local result = Array.flatMap({1, 2, 3}, function(value)
    return {value, value * 2}
end)
-- result is {1, 2, 2, 4, 3, 6}
```

*Related: [flatten](#flatten), [map](#map)*

## flatten

Flattens a nested array structure into a single-level array. Optional depth determines the limit up to which the flattening should occur.

```lua
local result = Array.flatten({1, {2, {3, 4}}, 5})
-- result is {1, 2, {3, 4}, 5}

local deepNestedArray = {1, {2, {3, {4, 5}, 6}, 7}, 8}
local resultWithDepth = Array.flatten(deepNestedArray, 2)
-- resultWithDepth is {1, 2, 3, {4, 5}, 6, 7, 8}
```

*Related: [flatMap](#flatMap)*

## fromFn

Generates an array by repeatedly applying a generating function.

```lua
local result = Array.fromFn(function(index)
	if index > 5 then
		return nil
	end
	return index * 2
end)
-- result is {2, 4, 6, 8, 10}
```

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

```lua
local result = Array.isEmpty({}) -- true
local result = Array.isEmpty({ 10 }) -- false
```

## map

Creates a new array by applying a function to each element in the array. If the function returns `nil`, it is skipped.

```lua
local squared = Array.map({1, 2, 3, 4}, function(value)
    return value * value
end)
-- squared is {1, 4, 9, 16}
```

*Related [flatMap]([#flatMap)*

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

Splits an array into two arrays based on a condition.

```lua
local trueResults, falseResults = Array.partition({1, 2, 3, 4, 5}, function(value)
    return value % 2 == 0
end)
-- trueResults is {2, 4}
-- falseResults is {1, 3, 5}
```

*Related [filter](#filter)*

## pop

Remove one (or many) elements from the end of the array.

```lua
local result = Array.pop({1, 2, 3, 4, 5})
-- result is {1, 2, 3, 4}

local result2 = Array.pop({1, 2, 3, 4, 5}, 3)
-- result2 is {1, 2}
```

*Related [popFirst](#popFirst), [range](#range)*

## popFirst

Remove one (or many) elements from the start of the array.

```lua
local result = Array.popFirst({1, 2, 3, 4, 5})
-- result is {2, 3, 4, 5}

local result2 = Array.popFirst({1, 2, 3, 4, 5}, 3)
-- result2 is {4, 5}
```

*Related [pop](#pop), [range](#range)*

## product

Calculate the product of an array of numbers.

```lua
local result = Array.product({2, 3, 4})
-- result is 24 (2 * 3 * 4)
```

*Related [productBy](#productBy), [sum](#sum), [sumBy](#sumBy)*

## productby

Calculates the product of an array given a mapping function that produces numbers.

```lua
local items = {{ value = 2 }, { value = 3 }, { value = 4 }}
local result = Array.productBy(items, function(item)
    return item.value
end)
-- result is 24 (2 * 3 * 4)
```

*Related [product](#product), [sum](#sum), [sumBy](#sumBy)*

## push

Add element(s) at the end of the array.

```lua
local array = {1, 2, 3}
local result = Array.push(array, 4, 5)
-- result is {1, 2, 3, 4, 5}
```

## range

Create a new array containing elements from the original array within the specified range.

```lua
local result = Array.range({'a', 'b', 'c', 'd', 'e', 'f'}, 2, 4)
-- result is {'b', 'c', 'd'}
```

*Related [pop](#pop), [popFirst](#popFirst)*

## reduce

Applies a function against an accumulator and each element in the array (from left to right) to reduce it to a single value.

```lua
local result = Array.reduce({"a", "b", "c"}, function(acc, value)
	acc[value] = true
    return acc
end, {})
-- result is { a = true, b = true, c = true }
```

## removeIndexes

Removes elements from an array based on their indexes.

```lua
local result = Array.removeIndexes({ 'a', 'b', 'c', 'd' }, { 4, 2 })
-- result is {'a', 'c'}
```

*Related [removeSortedIndexes](#removeSortedIndexes), [removeValues](#removeValues)*

## removeSortedIndexes

Removes elements using an array of indexes, but **the array of indexes should be sorted**.

```lua
local result = Array.removeSortedIndexes({ 'a', 'b', 'c', 'd' }, { 2, 4 })
-- result is {'a', 'c'}
```

*Related [removeIndexes](#removeIndexes), [removeValues](#removeValues)*

## removeValues

Removes specified values from an array.

```lua
local result = Array.removeValues({ 'a', 'b', 'c', 'd' }, 'b', 'd')
-- result is {'a', 'c'}
```

*Related [removeIndexes](#removeIndexes), [removeSortedIndexes](#removeSortedIndexes)*

## reversed

Create a new array but with the element in reverse order. For an array of less than 2 elements, this function will return the same array.

```lua
local result = Array.reversed({ 1, 2, 3 }) --> { 3, 2, 1 }
```

## sort

For a given array, the function returns a new one with its element sorted.

An optional comparator function can be provided to customize how the elements are compared.

For an array of less than 2 elements, this function will return the same array.

```lua
local array = {
    { name = 'Charlie' },
    { name = 'Alice' },
    { name = 'Bob' },
}

local result = Array.sort(array, function(a, b)
	return value.name < value.name
end)
-- result is {
--    { name = 'Alice' },
--    { name = 'Bob' },
--    { name = 'Charlie' },
-- }
```

*Related [sortByKey](#sortByKey)*

## sortByKey

Sorts an array of objects based on a mapping function results.

```lua
local array = {
    { name = 'Charlie' },
    { name = 'Alice' },
    { name = 'Bob' },
}

local result = Array.sortByKey(array, function(value)
	return value.name
end)
-- result is {
--    { name = 'Alice' },
--    { name = 'Bob' },
--    { name = 'Charlie' },
-- }
```

*Related [sort](#sort)*

## stepBy

Create a new array by selecting elements every given `step` amount.

```lua
local originalArray = { "1", "2", "3", "4", "5" }
local result = Array.stepBy(originalArray, 2)
-- result is { "1", "3", "5" }
```

**Note:** The function supports both positive and negative step values. A negative step value takes elements in reverse.

## sum

Calculates the sum of an array of numbers.

```lua
local total = Array.sum({20, 10, 30})
-- total is 60
```

*Related [sumBy](#sumBy), [product](#product), [productBy](#productBy)*

## sumBy

Calculates the sum of an array given a mapping function that produces numbers.

```lua
local array = {
    { price = 20 },
    { price = 10 },
    { price = 30 },
}

local total = Array.sumBy(array, function(item)
    return item.price
end)
-- total is 60
```


*Related [sum](#sum), [product](#product), [productBy](#productBy)*

## takeWhile

Create a new array from the start of the original array, up to the first element that does not satisfy a given condition.

```lua
local originalArray = { 3, 1, 4, 1, 5, 3, 1, 9}
local result = Array.takeWhile(originalArray, function(element)
    return element <= 5
end)
-- result is { 3, 1, 4, 1, 5 }
```

**Note:** The function also supports an optional `start`` parameter which skips the first elements.

## zip

Combine multiple arrays into a single array of tuples, which are just arrays in Luau. The tuples (or sub-arrays) contains the i-th elements from each of the input arrays.

**Note:** The resulting array's length is determined by the shortest input array. Extra elements from longer arrays are skipped.

```lua
local array1 = {1, 2, 3}
local array2 = {'a', 'b', 'c'}
local array3 = {true, false, true}

local result = Array.zip(array1, array2, array3)
-- result is { {1, 'a', true}, {2, 'b', false}, {3, 'c', true} }
```
