# Set

In this section, you will find multiple functions to work with sets. In Lua (or Luau), sets are defined as tables where keys all map to `true` values.

In your code, it is encouraged to put this part of the library into a variable:

```lua
local Set = Disk.Set
```

If you are not familiar with this kind of utility functions, don't get overwhelmed and start with these:

- [count](#count)
- [fromArray](#fromarray)
- [merge](#merge)
- [removeValues](#removeValues)

## count

Returns the number of entries in the given set.

```lua
local result = Set.count({ a = true, b = true })
-- result is 2
```

*Related [isEmpty](#isempty)*

## filter

Creates a set from only elements that satisfy a condition.

```lua
local set = Set.fromArray({ 1, 2, 3, 4, 5, 6 })
local result = Set.filter(set, function(value)
    return value % 2 == 0
end)
-- result is { 2 = true, 4 = true, 6 = true }
```

*Related [removeValues](#removevalues)*

## fromArray

Creates a new Set from an array of values.

```lua
local result = Set.fromArray({ "a", "b", "c" })
-- result is { a = true, b = true, c = true }
```

## isEmpty

Returns `true` if a set has no entries.

```lua
local result = Set.isEmpty({ }) --> true
local result = Set.isEmpty({ key = true }) -- false
```

*Related [count](#count)*

## map

Returns a new set where each value is converted with a mapping function. When the mapping function returns a `nil` value, the entry is removed.

```lua
local set = Set.fromArray({ 1, 2, 3 })
local result = Set.map(set, function(value)
    return value * 2
end)
-- result is { 2 = true, 4 = true, 6 = true }
```

## merge

Merge multiple sets into a single set.

```lua
local set1 = Set.fromArray({ "a", "b" })
local set2 = Set.fromArray({ "b", "c" })
local result = Set.merge(set1, set2)
-- result is { a = true, b = true, c = true }
```

The function will skip `nil` values when merging.

## removeValues

Returns a new set with all the given values removed.

```lua
local set = Set.fromArray({ "a", "b", "c" })
local result = Set.removeValues(set, "b")
-- result is { a = true, c = true }
```

**Note:** This function returns the same set if no values are given or if the values to remove are not in the set.

*Related [filter](#filter)*
