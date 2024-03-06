local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local sort = require('../sort')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('sorts numbers', function()
    local result = sort({ 1, 2, 3, 4 })

    expect(result).toEqual({ 1, 2, 3, 4 })
end)

it('sorts strings using a custom comparator function', function()
    local result = sort({ 'hello', 'a', 'fn' }, function(a, b)
        return #a < #b
    end)

    expect(result).toEqual({ 'a', 'fn', 'hello' })
end)

it('returns the same array if it is empty', function()
    local original = {}
    local result = sort(original)

    expect(result).toBe(original)
end)

return nil
