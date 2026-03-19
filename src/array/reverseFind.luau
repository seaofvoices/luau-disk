local function reverseFind<T>(
    array: { T },
    predicate: (element: T, index: number) -> boolean,
    start: number?
): T?
    local length = #array

    for i = start or length, 1, -1 do
        local element = array[i]
        if predicate(element, i) then
            return element
        end
    end

    return nil
end

return reverseFind
