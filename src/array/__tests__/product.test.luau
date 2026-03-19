local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local product = require('../product')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('returns the product of all the values', function()
    local result = product({ 5, 8, 2, 4 })

    expect(result).toEqual(5 * 8 * 2 * 4)
end)

it('returns 1 if the array is empty', function()
    local result = product({})

    expect(result).toEqual(1)
end)

it('returns the only value', function()
    local result = product({ 4 })

    expect(result).toEqual(4)
end)

it('returns the initial value if the array is empty', function()
    local result = product({}, 10)

    expect(result).toEqual(10)
end)

it('returns the product of all the values and the initial value', function()
    local result = product({ 20, 60, 50 }, 100)

    expect(result).toEqual(100 * 20 * 60 * 50)
end)

return nil
