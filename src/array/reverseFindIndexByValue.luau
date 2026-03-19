local function reverseFindIndexByValue<T>(array: { T }, element: T, start: number?): number?
    local length = #array

    for i = start or length, 1, -1 do
        if array[i] == element then
            return i
        end
    end

    return nil
end

return reverseFindIndexByValue
