local function reverseFindMap<T, U>(
    array: { T },
    mapFn: (element: T, index: number) -> U?,
    start: number?
): U?
    local length = #array

    for i = start or length, 1, -1 do
        local element = array[i]
        local result = mapFn(element, i)
        if result ~= nil then
            return result
        end
    end

    return nil
end

return reverseFindMap
