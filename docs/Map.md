# Map

In this section, you will find multiple functions to work with maps (or dictionaries if you prefer).

In your code, it is encouraged to put this part of the library into a variable:

```lua
local Map = Disk.Map
```

If you are not familiar with this kind of utility functions, don't get overwhelmed and start with these:

- [keys](#keys)
- [values](#values)
- [count](#count)
- [merge](#merge)

# copy

Makes a **shallow** copy of a map.

```lua
local value = { key = "value" }
local result = Map.copy(value)

print(value == result) -- false
print(value.key == result.key) -- true
```

# count

Returns the number of key-value pairs in the given map.

```lua
local result = Map.count({ a = "A", b = "B" })
-- result is 2
```

*Related [isEmpty](#isEmpty)*

# entries

Create an array of key-value pairs from the map.

```lua
local result = Map.entries({ a = "A", b = "B" })
-- result is {{"a", "A"}, {"b", "B"}}
```

Optionally, two values can be passed to use as object keys when creating the array.

```lua
local result = Map.entries({ a = "A", b = "B" }, "letter", "upper")
-- result is {{ letter = "a", upper = "A"}, { letter = "b", upper = "B"}}
```

# invert

Creates a new map by swapping keys and values of the original map.

```lua
local result = Map.invert({ a = "A", b = "B" })
-- result is { A = "a", B = "b" }
```

# isEmpty

Returns `true` if a map has no entries.

```lua
local result = Map.isEmpty({ }) --> true
local result = Map.isEmpty({ key = "" }) -- false
```

*Related [count](#count)*

# keys

Returns an array containing all the keys of the given map.

```lua
local result = keys({ a = true, b = false }) --> { 'a', 'b' }
```

**Note:** Lua/Luau does not guarantee the iteration order of maps, so this function does not guarantee the ordering of the keys.

*Related [values](#values)*

# mapEntries

Returns a new map where each key-value pair is converted with a mapping function. When the mapping function returns a `nil` value, the entry is removed.

```lua
local result = Map.mapEntries({ a = 1, b = 2, c = 3 }, function(key, value)
    return string.upper(key), tostring(value)
end)
-- result is { A = "1", B  = "2", C = "3" }
```

*Related [mapValues](#mapValues)*

# mapValues

Returns a new map where each value is converted with a mapping function. When the mapping function returns a `nil` value, the entry is removed.

```lua
local result = Map.mapValues({ a = 1, b = 2, c = 3 }, tostring)
-- result is { a = "1", b  = "2", c = "3" }
```

*Related [mapEntries](#mapEntries)*

# merge

Merge multiple maps into a single map, with precedence given to the latest maps.

```lua
local result = Map.merge({ name = 'John' }, { age = 30 })
-- result is { name = "John", age = 30 }
```

The function will skipped

# remove

Returns a new map with all the given keys removed.

```lua
local result = remove({ property = true, other = false }, 'other')
-- result is { property = true }
```

**Note:** This function returns the same map if no keys are given

# values

Returns an array containing all the values of the given map.

```lua
local result = keys({ a = true, b = false }) --> { true, false }
```

**Note:** Lua/Luau does not guarantee the iteration order of maps, so this function does not guarantee the ordering of the values.

*Related [keys](#keys)*
