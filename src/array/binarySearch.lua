local function binarySearch<T>(array: { T }, value: T, compareFn: ((a: T, b: T) -> number)?): number?
    local length = #array
    if length == 0 then
        return nil
    end

    local left = 1
    local right = length

    if compareFn == nil then
        local value: number = value :: any

        while left <= right do
            local mid = math.floor((left + right) / 2)
            local midElement: number = array[mid] :: any

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

    while left <= right do
        local mid = math.floor((left + right) / 2)
        local comparison = compareFn(array[mid], value)

        if comparison == 0 then
            return mid
        elseif comparison < 0 then
            left = mid + 1
        else
            right = mid - 1
        end
    end

    return nil
end

type BinarySearchFn =
    ((array: { number | string }, value: number | string) -> number?)
    & (<T>(array: { T }, value: T, compareFn: (a: T, b: T) -> number) -> number?)

return (binarySearch :: any) :: BinarySearchFn
