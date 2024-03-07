local alternate = require('../alternate')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('creates a new array that alternate values from 2 given arrays', function()
    local result = alternate({ 2, 4 }, { 3, 5 })

    expect(result).toEqual({ 2, 3, 4, 5 })
end)

it('creates a new array that alternate values from 3 given arrays', function()
    local result = alternate({ 2, 4 }, { 'a', 'b' }, { 3, 5 })

    expect(result).toEqual({ 2 :: number | string, 'a', 3, 4, 'b', 5 })
end)

it('returns an empty array if one array is empty', function()
    local result = alternate({ 2, 4 }, {})

    expect(result).toEqual({})
end)

it('returns the same array if given only one', function()
    local original = { 1, 2, 3, 4 }
    local result = alternate(original)

    expect(result).toBe(original)
end)

return nil
