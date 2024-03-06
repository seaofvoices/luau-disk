local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local removeSortedIndexes = require('../removeSortedIndexes')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('returns the same array when empty', function()
    local empty = {}
    local result = removeSortedIndexes(empty, { 1, 3 })

    expect(result).toBe(empty)
end)

it('returns the same array when given empty indexes array', function()
    local array = { 'a', 'b', 'c', 'd' }
    local result = removeSortedIndexes(array, {})

    expect(result).toBe(array)
end)

it('returns the same array when given indexes out of bounds', function()
    local array = { 'a', 'b', 'c', 'd' }
    local result = removeSortedIndexes(array, { 5, 7, 9 })

    expect(result).toBe(array)
end)

it('removes a single element from the array', function()
    local array = { 'a', 'b', 'c', 'd' }
    local result = removeSortedIndexes(array, { 2 })

    expect(result).toEqual({ 'a', 'c', 'd' })
end)

it('removes multiple elements from the array', function()
    local array = { 'a', 'b', 'c', 'd', 'e', 'f' }
    local result = removeSortedIndexes(array, { 2, 3, 6 })

    expect(result).toEqual({ 'a', 'd', 'e' })
end)

it('removes indexes with duplicates', function()
    local array = { 'a', 'b', 'c', 'd', 'e' }
    local result = removeSortedIndexes(array, { 2, 2, 4 })

    expect(result).toEqual({ 'a', 'c', 'e' })
end)

it('removes index within the array but skips indexes exceeding array length', function()
    local array = { 'a', 'b', 'c', 'd' }
    local result = removeSortedIndexes(array, { 1, 5, 8 })

    expect(result).toEqual({ 'b', 'c', 'd' })
end)

it('handles mixed data types in the array', function()
    type Mixed = { number | string | boolean }
    local array: Mixed = { 1, 'hello', true, 'world', 42 }
    local result = removeSortedIndexes(array, { 2, 4 })

    expect(result).toEqual({ 1, true, 42 } :: Mixed)
end)

it('returns an empty array when all indexes are removed', function()
    local array = { 'a', 'b', 'c', 'd' }
    local result = removeSortedIndexes(array, { 1, 2, 3, 4 })

    expect(result).toEqual({})
end)

return nil
