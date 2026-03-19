local findIndex = require('./findIndex')

local function insertAfter<T>(
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

    if index == #array then
        table.insert(copy, value)
    else
        table.insert(copy, index + 1, value)
    end

    return copy
end

return insertAfter
