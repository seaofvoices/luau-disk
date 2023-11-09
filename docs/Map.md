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
local newMap = Map.copy({ key = "value" })
```

# count

Returns the number of key-value pairs in the given map.

# entries

*Todo*

# isEmpty

Returns `true` if a map has no entries.

# keys

Returns an array containing all the keys of the given map.

```lua
local result = keys({ a = true, b = false }) --> { 'a', 'b' }
```

**Note:** Lua/Luau does not guarantee the iteration order of maps, so this function does not guarantee the ordering of the keys.

*Related [values](#values)*

# mapEntries

*Todo*

# mapValues

*Todo*

# merge

*Todo*

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
