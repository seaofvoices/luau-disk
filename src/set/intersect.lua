local SetType = require('./type')

type Set<T> = SetType.Set<T>

local function intersect<T>(...: Set<T>?): Set<T>
    local sets = {}

    for i = 1, select('#', ...) do
        local setValue = select(i, ...)
        if setValue then
            if next(setValue) == nil then
                return {}
            end

            table.insert(sets, setValue)
        end
    end

    local length = #sets

    if length == 0 then
        return {}
    elseif length == 1 then
        return sets[1]
    else
        local removeKeys = {}
        local first = sets[1]

        for key in first do
            for i = 2, length do
                local currentSet = sets[i]

                if not currentSet[key] then
                    table.insert(removeKeys, key)
                    break
                end
            end
        end

        if #removeKeys == 0 then
            return first
        end

        local result: Set<T> = table.clone(first)

        for _, key in removeKeys do
            result[key] = nil
        end

        return result
    end
end

return intersect
