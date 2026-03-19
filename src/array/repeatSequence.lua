local isEmpty = require('./isEmpty')

local function repeatSequence<T>(array: { T }, count: number): { T }
    if count == 1 or isEmpty(array) then
        return array
    elseif count <= 0 then
        return {}
    end

    local result = table.clone(array)
    local length = #array

    for i = 1, count - 1 do
        for j = 1, length do
            table.insert(result, array[j])
        end
    end

    return result
end

return repeatSequence
