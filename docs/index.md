# Disk

Here is the top level content of the Disk library:

```lua
local Disk = require('@pkg/luau-disk')

local Array = Disk.Array
local Map = Disk.Map
local Set = Disk.Set
local WeakMap = Disk.WeapMap

type Set<T> = Disk.Set<T>
```

# Array

```lua
local Array = Disk.Array
```

For functions that operates on arrays (or related to arrays): [Array documentation](./Array.md)

# Map

```lua
local Map = Disk.Map
```

For functions that operates on maps (or related to maps): [Map documentation](./Map.md)

# Set

```lua
local Set = Disk.Set
```

For functions that operates on sets (or related to sets): [Set documentation](./Set.md)

# WeakMap

Create a new empty weak map.

```lua
local value = Disk.WeakMap()
```

WeakMap can be called on an existing map to turn it into a weak map:

```lua
local value = Disk.WeakMap({ [player] = data })
```
