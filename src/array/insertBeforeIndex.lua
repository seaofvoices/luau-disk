local function insertBeforeIndex<T>(array: { T }, value: T, index: number): { T }
    local copy = table.clone(array)
    local length = #copy

    if index < 1 then
        table.insert(copy, 1, value)
    elseif index > length then
        table.insert(copy, value)
    else
        table.insert(copy, index, value)
    end

    return copy
end

return insertBeforeIndex
