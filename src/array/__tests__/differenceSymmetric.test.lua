local differenceSymmetric = require('../differenceSymmetric')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('returns symmetric difference between two arrays', function()
    local result = differenceSymmetric({ 1, 2, 3 }, { 2, 3, 4 })

    expect(result).toEqual({ 1, 4 })
end)

it('returns empty array when arrays are identical', function()
    local result = differenceSymmetric({ 1, 2, 3 }, { 1, 2, 3 })

    expect(result).toEqual({})
end)

it('returns combined arrays when no common elements', function()
    local result = differenceSymmetric({ 1, 2 }, { 3, 4 })

    expect(result).toEqual({ 1, 2, 3, 4 })
end)

it('works with empty first array', function()
    local result = differenceSymmetric({}, { 1, 2, 3 })

    expect(result).toEqual({ 1, 2, 3 })
end)

it('works with empty second array', function()
    local value = { 1, 2, 3 }
    local result = differenceSymmetric(value, {})

    expect(result).toBe(value)
end)

it('works with both arrays empty', function()
    local result = differenceSymmetric({}, {})

    expect(result).toEqual({})
end)

it('handles symmetric difference with multiple arrays', function()
    local result = differenceSymmetric({ 1, 2, 3 }, { 2, 3, 4 }, { 3, 4, 5 })

    expect(result).toEqual({ 1, 5 })
end)

it('preserves order from first array, then adds from others', function()
    local result = differenceSymmetric({ 'a', 'b', 'c' }, { 'b', 'c', 'd' })

    expect(result).toEqual({ 'a', 'd' })
end)

it('handles duplicate elements within arrays', function()
    local result = differenceSymmetric({ 1, 1, 2, 3 }, { 2, 3, 3, 4, 4 })

    expect(result).toEqual({ 1, 1, 4, 4 })
end)

it('handles no additional arrays (returns original)', function()
    local original = { 1, 2, 3 }
    local result = differenceSymmetric(original)

    expect(result).toBe(original)
    expect(result).toEqual({ 1, 2, 3 })
end)

it('works with three arrays', function()
    local result = differenceSymmetric({ 1, 2, 3 }, { 2, 3, 4 }, { 3, 4, 5 })

    expect(result).toEqual({ 1, 5 })
end)

it('handles single element arrays', function()
    local result = differenceSymmetric({ 1 }, { 1 })

    expect(result).toEqual({})
end)

it('handles single element arrays with no match', function()
    local result = differenceSymmetric({ 1 }, { 2 })

    expect(result).toEqual({ 1, 2 })
end)

it('handles four arrays correctly', function()
    local result = differenceSymmetric({ 1, 2 }, { 2, 3 }, { 3, 4 }, { 4, 5 })

    expect(result).toEqual({ 1, 5 })
end)

it('handles arrays with all unique elements', function()
    local result = differenceSymmetric({ 1, 2 }, { 3, 4 }, { 5, 6 })

    expect(result).toEqual({ 1, 2, 3, 4, 5, 6 })
end)

return nil
