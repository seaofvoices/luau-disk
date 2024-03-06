local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local reversed = require('../reverse')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('reverses a list', function()
    local result = reversed({ 1, 2, 3, 4 })

    expect(result).toEqual({ 4, 3, 2, 1 })
end)

it('returns the same list when it is empty', function()
    local original = {}
    local result = reversed(original)

    expect(result).toBe(original)
end)

it('returns the same list when it has one element', function()
    local original = { 'hello' }
    local result = reversed(original)

    expect(result).toBe(original)
end)

return nil
