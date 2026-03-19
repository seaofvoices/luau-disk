local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local productBy = require('../productBy')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('returns the sum of all the values', function()
    local result = productBy({ '5', '8', '2', '4' }, tonumber :: any)

    expect(result).toEqual(5 * 8 * 2 * 4)
end)

it('returns 1 if the array is empty', function()
    local result = productBy({}, tonumber :: any)

    expect(result).toEqual(1)
end)

it('returns the initial value if the array is empty', function()
    local result = productBy({}, tonumber :: any, 10)

    expect(result).toEqual(10)
end)

it('returns the sum of all the values and the initial value', function()
    local result = productBy({ '20', '60', '50' }, tonumber :: any, 100)

    expect(result).toEqual(100 * 20 * 60 * 50)
end)

return nil
