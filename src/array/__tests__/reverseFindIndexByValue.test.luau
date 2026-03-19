local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local reverseFindIndexByValue = require('../reverseFindIndexByValue')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('finds the index of the last matching value', function()
    local array = { 1, 2, 3, 2, 4 }
    local result = reverseFindIndexByValue(array, 2)

    expect(result).toBe(4)
end)

it('returns nil when value is not found', function()
    local array = { 1, 2, 3, 4, 5 }
    local result = reverseFindIndexByValue(array, 6)

    expect(result).toBe(nil)
end)

it('starts from the given index', function()
    local array = { 1, 2, 3, 2, 4 }
    local result = reverseFindIndexByValue(array, 2, 3)

    expect(result).toBe(2)
end)

it('handles empty array', function()
    local array = {}
    local result = reverseFindIndexByValue(array, 1)

    expect(result).toBe(nil)
end)

return nil
