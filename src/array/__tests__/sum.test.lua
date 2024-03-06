local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local sum = require('../sum')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('returns the sum of all the values', function()
    local result = sum({ 5, 8, 2, 4 })

    expect(result).toEqual(5 + 8 + 2 + 4)
end)

it('returns 0 if the array is empty', function()
    local result = sum({})

    expect(result).toEqual(0)
end)

it('returns the only value', function()
    local result = sum({ 4 })

    expect(result).toEqual(4)
end)

it('returns the initial value if the array is empty', function()
    local result = sum({}, 10)

    expect(result).toEqual(10)
end)

it('returns the sum of all the values and the initial value', function()
    local result = sum({ 20, 60, 50 }, 100)

    expect(result).toEqual(100 + 20 + 60 + 50)
end)

return nil
