local fromArray = require('../fromArray')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('returns a new empty set from an empty array', function()
    local array = {}
    local result = fromArray(array)
    expect(result).toEqual({})
    expect(result).never.toBe(array)
end)

it('returns a set from an array', function()
    expect(fromArray({ 'a', 'b' })).toEqual({ a = true, b = true })
end)

it('returns a set from an array with duplicated elements', function()
    expect(fromArray({ 'a', 'a', 'a' })).toEqual({ a = true })
end)

return nil
