local function count<T>(array: { T }, predicate: ((T, number) -> boolean)?): number
    if predicate == nil then
        return #array
    end

    local total = 0

    for i, element in array do
        if predicate(element, i) then
            total += 1
        end
    end

    return total
end

return count
