local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local minimum = require('../minimum')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('finds the minimum value', function()
    local result = minimum({ 5, 8, 2, 4 }, math.huge)

    expect(result).toEqual(2)
end)

it('returns the initial value if the array is empty', function()
    local result = minimum({}, 10)

    expect(result).toEqual(10)
end)

it('returns the initial value if it is the minimum', function()
    local result = minimum({ 20, 60, 50 }, 10)

    expect(result).toEqual(10)
end)

return nil
