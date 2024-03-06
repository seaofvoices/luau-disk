local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local pop = require('../pop')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('removes the last element of the array', function()
    local result = pop({ true, false })

    expect(result).toEqual({ true })
end)

it('returns the same array when pop count is zero', function()
    local original = { true, false }
    local result = pop(original, 0)

    expect(result).toBe(original)
end)

it('removes exactly all the elements', function()
    local result = pop({ true, false }, 2)

    expect(result).toEqual({})
end)

it('removes more than the total number of elements', function()
    local result = pop({ true, false }, 10)

    expect(result).toEqual({})
end)

it('removes 2 elements of an array of length 3', function()
    local result = pop({ 3, 2, 1 }, 2)

    expect(result).toEqual({ 3 })
end)

it('does not mutate the original array', function()
    local original = { true, false }
    local _ = pop(original)

    expect(original).toEqual({ true, false })
end)

return nil
