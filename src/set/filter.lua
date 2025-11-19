local SetType = require('./type')

type Set<T> = SetType.Set<T>

local function filter<T>(set: Set<T>, predicate: (value: T) -> boolean): Set<T>
    local result: Set<T> = {}

    for value in set do
        if predicate(value) then
            result[value] = true
        end
    end

    return result
end

return filter
