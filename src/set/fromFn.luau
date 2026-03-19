local type = require('./type')

type Set<T> = type.Set<T>

local function fromFn<T>(generator: (number) -> T?): Set<T>
    local set: Set<T> = {}

    local i = 1
    while true do
        local element = generator(i)
        i += 1
        if element == nil then
            break
        elseif set[element] == nil then
            set[element] = true
        end
    end

    return set
end

return fromFn
