local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local removeValues = require('../removeValues')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('returns the same array when empty', function()
    local empty = {}
    local result = removeValues(empty, 1, 3)

    expect(result).toBe(empty)
end)

it('returns the same array when no value is given', function()
    local empty = {}
    local result = removeValues(empty)

    expect(result).toBe(empty)
end)

it('returns the same array when a nil value is given', function()
    local empty = {}
    local result = removeValues(empty, nil)

    expect(result).toBe(empty)
end)

it('returns the same array when multiple nil value are given', function()
    local empty = {}
    local result = removeValues(empty, nil, nil, nil)

    expect(result).toBe(empty)
end)

it('returns the same array when no value are removed', function()
    local original = { 'a', 'b', 'c', 'd' }
    local result = removeValues(original, 'e')

    expect(result).toBe(original)
end)

it('removes a single value at the end of the array', function()
    local original = { 'a', 'b', 'c', 'd' }
    local result = removeValues(original, 'd')

    expect(result).toEqual({ 'a', 'b', 'c' })
end)

it('removes a single value at the beginning of the array', function()
    local original = { 'a', 'b', 'c', 'd' }
    local result = removeValues(original, 'a')

    expect(result).toEqual({ 'b', 'c', 'd' })
end)

it('removes a single value in the array', function()
    local original = { 'a', 'b', 'c', 'd' }
    local result = removeValues(original, 'b')

    expect(result).toEqual({ 'a', 'c', 'd' })
end)

it('removes multiple values from the array', function()
    local original = { 'a', 'b', 'c', 'd', 'b', 'e' }
    local result = removeValues(original, 'b', 'e')

    expect(result).toEqual({ 'a', 'c', 'd' })
end)

it('removes all occurrences of a value from the array', function()
    local original = { 'a', 'b', 'c', 'b', 'd', 'b' }
    local result = removeValues(original, 'b')

    expect(result).toEqual({ 'a', 'c', 'd' })
end)

it('handles mixed data types in the array', function()
    type Mixed = { number | string | boolean }
    local original: Mixed = { 1, 'hello', true, 'world', 42 }
    local result = removeValues(original, 'hello', true)

    expect(result).toEqual({ 1, 'world', 42 } :: Mixed)
end)

it('handles removal of multiple values, some of which are not in the array', function()
    local original = { 'a', 'b', 'c', 'd' }
    local result = removeValues(original, 'a', 'b', 'e', 'f')

    expect(result).toEqual({ 'c', 'd' })
end)

it('returns an empty array when all values are removed', function()
    local original = { true, true, true }
    local result = removeValues(original, true)

    expect(result).toEqual({})
end)

return nil
