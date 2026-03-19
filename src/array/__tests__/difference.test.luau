local difference = require('../difference')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('returns basic difference between two arrays', function()
    local result = difference({ 1, 2, 3, 4 }, { 2, 4 })

    expect(result).toEqual({ 1, 3 })
end)

it('returns empty array when all elements are common', function()
    local result = difference({ 1, 2, 3 }, { 1, 2, 3 })

    expect(result).toEqual({})
end)

it('returns original array when no common elements', function()
    local value = { 1, 2, 3 }
    local result = difference(value, { 4, 5, 6 })

    expect(result).toBe(value)
end)

it('returns original array when empty', function()
    local value = {}
    local result = difference(value, { 1, 2, 3 })

    expect(result).toBe(value)
end)

it('returns original array when second array is empty', function()
    local value = { 1, 2, 3 }
    local result = difference(value, {})

    expect(result).toBe(value)
end)

it('works with both arrays empty', function()
    local value = {}
    local result = difference(value, {})

    expect(result).toBe(value)
end)

it('handles difference with multiple arrays', function()
    local result = difference({ 1, 2, 3, 4, 5 }, { 2, 4 }, { 3, 5 })

    expect(result).toEqual({ 1 })
end)

it('preserves order in result', function()
    local result = difference({ 'a', 'b', 'c', 'd', 'e' }, { 'd', 'b' })

    expect(result).toEqual({ 'a', 'c', 'e' })
end)

it('handles duplicate elements within first array', function()
    local result = difference({ 1, 2, 2, 3, 3 }, { 2 })

    expect(result).toEqual({ 1, 3, 3 })
end)

it('handles duplicate elements in comparison arrays', function()
    local result = difference({ 1, 2, 3, 4 }, { 2, 2, 3, 3 })

    expect(result).toEqual({ 1, 4 })
end)

it('works with three arrays', function()
    local result = difference({ 1, 2, 3, 4, 5, 6 }, { 2, 4 }, { 3, 5 }, { 6 })

    expect(result).toEqual({ 1 })
end)

it('handles single element arrays', function()
    local result = difference({ 1 }, { 1 })

    expect(result).toEqual({})
end)

it('handles single element arrays with no match', function()
    local value = { 1 }
    local result = difference(value, { 2 })

    expect(result).toBe(value)
end)

it('removes all occurrences when found in any comparison array', function()
    local result = difference({ 1, 2, 2, 3, 2 }, { 2 })

    expect(result).toEqual({ 1, 3 })
end)

return nil
