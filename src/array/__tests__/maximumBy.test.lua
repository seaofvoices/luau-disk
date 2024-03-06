local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local maximumBy = require('../maximumBy')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('finds the maximum value', function()
    local result = maximumBy({ '5', '8', '2', '4' }, tonumber :: any, 0)

    expect(result).toEqual(8)
end)

it('returns the initial value if the array is empty', function()
    local result = maximumBy({}, tonumber :: any, 10)

    expect(result).toEqual(10)
end)

it('returns the initial value if it is the maximum', function()
    local result = maximumBy({ '20', '60', '50' }, tonumber :: any, 100)

    expect(result).toEqual(100)
end)

return nil
