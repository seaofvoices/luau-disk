local SetType = require('./type')

type Set<T> = SetType.Set<T>

local function toArray<T>(set: Set<T>): { T }
    local result = {}
    for value in set do
        table.insert(result, value)
    end
    return result
end

return toArray
