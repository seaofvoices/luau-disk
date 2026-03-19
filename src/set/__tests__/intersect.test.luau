local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local fromArray = require('../fromArray')
local intersect = require('../intersect')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('returns intersection of two sets with common elements', function()
    local set1 = fromArray({ 1, 2, 3, 4 })
    local set2 = fromArray({ 3, 4, 5, 6 })
    local result = intersect(set1, set2)

    expect(result).toEqual(fromArray({ 3, 4 }))
end)

it('returns empty set when sets have no common elements', function()
    local set1 = fromArray({ 1, 2, 3 })
    local set2 = fromArray({ 4, 5, 6 })
    local result = intersect(set1, set2)

    expect(result).toEqual({})
end)

it('returns intersection of multiple sets', function()
    local set1 = fromArray({ 1, 2, 3, 4, 5 })
    local set2 = fromArray({ 2, 3, 4, 5, 6 })
    local set3 = fromArray({ 3, 4, 5, 6, 7 })
    local result = intersect(set1, set2, set3)

    expect(result).toEqual(fromArray({ 3, 4, 5 }))
end)

it('returns empty set when any set is empty', function()
    local set1 = fromArray({ 1, 2, 3 })
    local set2 = {}
    local set3 = fromArray({ 2, 3, 4 })
    local result = intersect(set1, set2, set3)

    expect(result).toEqual({})
end)

it('returns empty set when no sets are provided', function()
    local result = intersect()

    expect(result).toEqual({})
end)

it('returns the original set when only one set is provided', function()
    local set1 = fromArray({ 1, 2, 3, 4 })
    local result = intersect(set1)

    expect(result).toBe(set1)
end)

it('returns original set when other sets are nil', function()
    local set1 = fromArray({ 1, 2, 3 })
    local result = intersect(set1, nil, nil)

    expect(result).toBe(set1)
end)

it('handles identical sets', function()
    local set1 = fromArray({ 1, 2, 3 })
    local set2 = fromArray({ 1, 2, 3 })
    local result = intersect(set1, set2)

    expect(result).toEqual(fromArray({ 1, 2, 3 }))
end)

it('works with string sets', function()
    local set1 = fromArray({ 'apple', 'banana', 'cherry' })
    local set2 = fromArray({ 'banana', 'cherry', 'date' })
    local result = intersect(set1, set2)

    expect(result).toEqual(fromArray({ 'banana', 'cherry' }))
end)

it('works with mixed type sets', function()
    local set1 = fromArray({ 1 :: any, 'hello', true })
    local set2 = fromArray({ 1 :: any, 'hello', false })
    local result = intersect(set1, set2)

    expect(result).toEqual(fromArray({ 1 :: any, 'hello' }))
end)

it('handles single element sets', function()
    local set1 = fromArray({ 42 })
    local set2 = fromArray({ 42 })
    local result = intersect(set1, set2)

    expect(result).toEqual(fromArray({ 42 }))
end)

it('returns empty set for single element sets with different elements', function()
    local set1 = fromArray({ 42 })
    local set2 = fromArray({ 24 })
    local result = intersect(set1, set2)

    expect(result).toEqual({})
end)

it('handles subsets correctly', function()
    local set1 = fromArray({ 1, 2, 3, 4, 5 })
    local set2 = fromArray({ 2, 3 })
    local result = intersect(set1, set2)

    expect(result).toEqual(fromArray({ 2, 3 }))
end)

it('handles supersets correctly', function()
    local set1 = fromArray({ 2, 3 })
    local set2 = fromArray({ 1, 2, 3, 4, 5 })
    local result = intersect(set1, set2)

    expect(result).toEqual(fromArray({ 2, 3 }))
end)

it('does not modify original sets', function()
    local set1 = fromArray({ 1, 2, 3, 4 })
    local set2 = fromArray({ 3, 4, 5, 6 })
    local originalSet1 = table.clone(set1)
    local originalSet2 = table.clone(set2)

    local result = intersect(set1, set2)

    expect(set1).toEqual(originalSet1)
    expect(set2).toEqual(originalSet2)
    expect(result).never.toBe(set1)
    expect(result).never.toBe(set2)
end)

it('works with four sets', function()
    local set1 = fromArray({ 1, 2, 3, 4, 5, 6 })
    local set2 = fromArray({ 2, 3, 4, 5, 6, 7 })
    local set3 = fromArray({ 3, 4, 5, 6, 7, 8 })
    local set4 = fromArray({ 4, 5, 6, 7, 8, 9 })
    local result = intersect(set1, set2, set3, set4)

    expect(result).toEqual(fromArray({ 4, 5, 6 }))
end)

it('returns first set when all elements are common', function()
    local set1 = fromArray({ 1, 2, 3 })
    local set2 = fromArray({ 1, 2, 3, 4, 5 })
    local set3 = fromArray({ 1, 2, 3, 6, 7 })
    local result = intersect(set1, set2, set3)

    expect(result).toBe(set1)
end)

it('handles boolean values in sets', function()
    local set1 = fromArray({ true, false })
    local set2 = fromArray({ true })
    local result = intersect(set1, set2)

    expect(result).toEqual(fromArray({ true }))
end)

it('handles empty intersection with multiple sets', function()
    local set1 = fromArray({ 1, 2 })
    local set2 = fromArray({ 3, 4 })
    local set3 = fromArray({ 5, 6 })
    local result = intersect(set1, set2, set3)

    expect(result).toEqual({})
end)

it('handles nested tables as set elements', function()
    local table1 = { 1, 2, 3 }
    local table2 = { 4, 5, 6 }
    local set1 = fromArray({ table1, table2 })
    local set2 = fromArray({ table1 })
    local result = intersect(set1, set2)

    expect(result).toEqual(fromArray({ table1 }))
end)

return nil
