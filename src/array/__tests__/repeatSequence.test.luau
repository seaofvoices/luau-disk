local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local repeatSequence = require('../repeatSequence')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('repeats the array the specified number of times', function()
    local array = { 1, 2, 3 }
    local result = repeatSequence(array, 3)

    expect(result).toEqual({ 1, 2, 3, 1, 2, 3, 1, 2, 3 })
end)

it('returns empty array when count is 0', function()
    local array = { 1, 2, 3 }
    local result = repeatSequence(array, 0)

    expect(result).toEqual({})
end)

it('returns empty array when count is negative', function()
    local array = { 1, 2, 3 }
    local result = repeatSequence(array, -1)

    expect(result).toEqual({})
end)

it('returns the same array reference when count is 1', function()
    local array = { 1, 2, 3 }
    local result = repeatSequence(array, 1)

    expect(result).toBe(array)
end)

it('returns the same empty array reference', function()
    local array = {}
    local result = repeatSequence(array, 3)

    expect(result).toBe(array)
end)

return nil
