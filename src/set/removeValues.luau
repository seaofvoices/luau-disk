local SetType = require('./type')
local isEmpty = require('./isEmpty')

type Set<T> = SetType.Set<T>

local function removeValues<T>(set: Set<T>, ...: T?): Set<T>
    local removeLength = select('#', ...)

    if removeLength == 0 or isEmpty(set) then
        return set
    end

    local result

    for i = 1, removeLength do
        local value: T? = select(i, ...)

        if value ~= nil and set[value] ~= nil then
            if result == nil then
                result = table.clone(set)
            end
            result[value] = nil
        end
    end

    return result or set
end

return removeValues
