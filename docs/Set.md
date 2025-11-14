# Set

In this section, you will find multiple functions to work with sets. In Lua (or Luau), sets are defined as tables where keys all map to `true` values.

In your code, it is encouraged to put this part of the library into a variable:

```lua
local Set = Disk.Set
```

If you are not familiar with this kind of utility functions, don't get overwhelmed and start with these:

- [fromArray](#fromarray)
- [merge](#merge)

## fromArray

Creates a new Set from an array of values.

```lua
local result = Set.fromArray({ "a", "b", "c" })
-- result is { a = true, b = true, c = true }
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
