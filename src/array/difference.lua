local removeSortedIndexes = require('./removeSortedIndexes')

local function difference<T>(array: { T }, ...: { T }?): { T }
    local arrayCount = select('#', ...)
    local arrayLength = #array

    if arrayCount == 0 or arrayLength == 0 then
        return array
    end

    local otherArrays = {}

    for i = 1, arrayCount do
        local otherArray = select(i, ...)
        if otherArray ~= nil and #otherArray ~= 0 then
            table.insert(otherArrays, otherArray)
        end
    end

    if #otherArrays == 0 then
        return array
    end

    local indexes = {}

    for index, element in array do
        for _, otherArray in otherArrays do
            if table.find(otherArray, element) then
                table.insert(indexes, index)
                break
            end
        end
    end

    local totalIndexes = #indexes

    if totalIndexes == 0 then
        return array
    elseif totalIndexes == arrayLength then
        return {}
    else
        return removeSortedIndexes(array, indexes)
    end
end

return difference
