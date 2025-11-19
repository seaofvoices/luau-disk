local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local fromArray = require('../fromArray')
local toArray = require('../toArray')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('converts set to array', function()
    local set = fromArray({ 1, 2, 3, 4, 5 })
    local result = toArray(set)

    expect(result).toEqual({ 1, 2, 3, 4, 5 })
end)

it('handles empty set', function()
    local set = fromArray({})
    local result = toArray(set)

    expect(result).toEqual({})
    expect(result).never.toBe(set)
end)

return nil
