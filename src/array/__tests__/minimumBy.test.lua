local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local minimumBy = require('../minimumBy')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('finds the minimum value', function()
    local result = minimumBy({ '5', '8', '2', '4' }, tonumber :: any, math.huge)

    expect(result).toEqual(2)
end)

it('returns the initial value if the array is empty', function()
    local result = minimumBy({}, tonumber :: any, 10)

    expect(result).toEqual(10)
end)

it('returns the initial value if it is the minimum', function()
    local result = minimumBy({ '20', '60', '50' }, tonumber :: any, 10)

    expect(result).toEqual(10)
end)

return nil
