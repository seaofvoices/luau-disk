local function reverseFindIndex<T>(
    array: { T },
    predicate: (element: T, index: number) -> boolean,
    start: number?
): number?
    local length = #array

    for i = start or length, 1, -1 do
        local element = array[i]
        if predicate(element, i) then
            return i
        end
    end

    return nil
end

return reverseFindIndex
