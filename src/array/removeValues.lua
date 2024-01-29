local function removeValues<T>(array: { T }, ...: T?): { T }
    local removeLength = select('#', ...)
    local arrayLenth = #array

    if removeLength == 0 or arrayLenth == 0 then
        return array
    end

    local removeIndexes = {}
    for index, element in array do
        for i = 1, removeLength do
            local value: T? = select(i, ...)

            if value ~= nil and element == value then
                table.insert(removeIndexes, index)
            end
        end
    end

    local removeLength = #removeIndexes

    if removeLength == 0 then
        return array
    elseif removeLength == arrayLenth then
        return {}
    else
        local cloned = table.clone(array)

        for i = removeLength, 1, -1 do
            table.remove(cloned, removeIndexes[i])
        end

        return cloned
    end
end

return removeValues
