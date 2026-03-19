local function binarySearchByKey<T, K>(array: { T }, value: K, keyFn: (element: T) -> K): number?
    local length = #array
    if length == 0 then
        return nil
    end

    local left = 1
    local right = length
    local value: number = value :: any

    while left <= right do
        local mid = math.floor((left + right) / 2)
        local midElement: number = keyFn(array[mid]) :: any

        if midElement < value then
            left = mid + 1
        elseif midElement > value then
            right = mid - 1
        else
            return mid
        end
    end

    return nil
end

return binarySearchByKey
