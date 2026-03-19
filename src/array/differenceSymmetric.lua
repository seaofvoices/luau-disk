local difference = require('./difference')
local removeSortedIndexes = require('./removeSortedIndexes')

local function differenceSymmetric<T>(array: { T }, ...: { T }): { T }
    local arrayCount = select('#', ...)

    if arrayCount == 0 then
        return array
    end

    local otherArrays = {}

    for i = 1, arrayCount do
        local otherArray = select(i, ...)
        if otherArray and #otherArray ~= 0 then
            table.insert(otherArrays, otherArray)
        end
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

    local finalResult

    if #indexes ~= 0 then
        finalResult = table.clone(array)

        for i = #indexes, 1, -1 do
            local index = indexes[i]
            table.remove(finalResult, index)
        end
    end

    for arrayIndex, otherArray in otherArrays do
        local others = removeSortedIndexes(otherArrays, { arrayIndex })
        table.insert(others, array)

        local result = difference(otherArray, unpack(others))

        if #result ~= 0 then
            if finalResult == nil then
                finalResult = table.clone(array)
            end

            for _, value in result do
                table.insert(finalResult, value)
            end
        end
    end

    return finalResult or array
end

return differenceSymmetric
