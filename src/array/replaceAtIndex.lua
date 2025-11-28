local function replaceAtIndex<T>(array: { T }, index: number, value: T): { T }
    local length = #array

    if index < 1 or index > length or array[index] == value then
        return array
    end

    local copy = table.clone(array)
    copy[index] = value

    return copy
end

return replaceAtIndex
