local findIndex = require('./findIndex')

local function insertBefore<T>(
    array: { T },
    value: T,
    predicate: (element: T) -> boolean,
    start: number?
): { T }
    local index = findIndex(array, predicate, start)

    if not index then
        return array
    end

    local copy = table.clone(array)
    table.insert(copy, index, value)

    return copy
end

return insertBefore
