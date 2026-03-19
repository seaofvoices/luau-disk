local SetType = require('./type')

type Set<T> = SetType.Set<T>

local function map<T, U>(set: Set<T>, fn: (value: T) -> U?): Set<U>
    local result: Set<U> = {}

    for value in set do
        local entry = fn(value)
        if entry ~= nil then
            result[entry] = true
        end
    end

    return result :: Set<U>
end

return map
