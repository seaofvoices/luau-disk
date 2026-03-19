local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local maximum = require('../maximum')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('finds the maximum value', function()
    local result = maximum({ 5, 8, 2, 4 }, 0)

    expect(result).toEqual(8)
end)

it('returns the initial value if the array is empty', function()
    local result = maximum({}, 10)

    expect(result).toEqual(10)
end)

it('returns the initial value if it is the maximum', function()
    local result = maximum({ 20, 60, 50 }, 100)

    expect(result).toEqual(100)
end)

return nil
