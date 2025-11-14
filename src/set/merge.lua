local SetType = require('./type')

type Set<T> = SetType.Set<T>

local function merge<T>(...: Set<T>?): Set<T>
    local first = nil
    local firstIndex = nil
    local length = select('#', ...)

    for i = 1, length do
        local mergeSet = select(i, ...)

        if mergeSet ~= nil then
            firstIndex = i
            first = mergeSet
            break
        end
    end

    if first == nil then
        error('attempt to merge only nil values')
    end

    if firstIndex == length then
        return first
    end

    local result = nil

    for i = firstIndex + 1, length do
        local mergeSet = select(i, ...)

        if mergeSet ~= nil then
            if result == nil then
                result = table.clone(first)
                setmetatable(result, nil)
            end

            local metatable = getmetatable(mergeSet)

            if metatable ~= nil and type(metatable.__call) == 'function' then
                for key in pairs(mergeSet) do
                    result[key] = true
                end
            else
                for key in mergeSet do
                    result[key] = true
                end
            end
        end
    end

    return result or first
end

return merge
