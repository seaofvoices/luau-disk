local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local popFirst = require('../popFirst')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('removes the last element of the array', function()
    local result = popFirst({ true, false })

    expect(result).toEqual({ false })
end)

it('returns the same array when pop count is zero', function()
    local original = { true, false }
    local result = popFirst(original, 0)

    expect(result).toBe(original)
end)

it('removes exactly all the elements', function()
    local result = popFirst({ true, false }, 2)

    expect(result).toEqual({})
end)

it('removes more than the total number of elements', function()
    local result = popFirst({ true, false }, 10)

    expect(result).toEqual({})
end)

it('removes 2 elements of an array of length 3', function()
    local result = popFirst({ 3, 2, 1 }, 2)

    expect(result).toEqual({ 1 })
end)

it('does not mutate the original array', function()
    local original = { true, false }
    local _ = popFirst(original)

    expect(original).toEqual({ true, false })
end)

return nil
