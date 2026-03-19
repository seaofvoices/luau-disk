local isArray = require('./isArray')

local function pluck<T, U>(array: { T }, key: any | { any }): { U }
    local length = #array

    local keys = if isArray(key) then key else { key }

    if #keys == 0 then
        return array :: any
    end

    local result = table.create(length)

    for _, element in array do
        local indexed: any = element

        local success = pcall(function()
            for _, value in keys do
                indexed = indexed[value]

                if indexed == nil then
                    break
                end
            end
        end)

        if not success then
            indexed = nil
        end

        if indexed ~= nil then
            table.insert(result, indexed)
        end
    end

    return result :: any
end

return pluck
