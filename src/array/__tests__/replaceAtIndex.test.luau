local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local replaceAtIndex = require('../replaceAtIndex')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('replaces value at valid index', function()
    local result = replaceAtIndex({ 1, 2, 3, 4 }, 2, 99)

    expect(result).toEqual({ 1, 99, 3, 4 })
end)

it('replaces value at first index', function()
    local result = replaceAtIndex({ 1, 2, 3 }, 1, 99)

    expect(result).toEqual({ 99, 2, 3 })
end)

it('replaces value at last index', function()
    local result = replaceAtIndex({ 1, 2, 3 }, 3, 99)

    expect(result).toEqual({ 1, 2, 99 })
end)

it('returns original array when index < 1', function()
    local original = { 1, 2, 3 }
    local result = replaceAtIndex(original, 0, 99)

    expect(result).toBe(original)
    expect(result).toEqual({ 1, 2, 3 })
end)

it('returns original array when index is negative', function()
    local original = { 1, 2, 3 }
    local result = replaceAtIndex(original, -5, 99)

    expect(result).toBe(original)
    expect(result).toEqual({ 1, 2, 3 })
end)

it('returns original array when index > length', function()
    local original = { 1, 2, 3 }
    local result = replaceAtIndex(original, 10, 99)

    expect(result).toBe(original)
    expect(result).toEqual({ 1, 2, 3 })
end)

it('returns original array when index equals length + 1', function()
    local original = { 1, 2, 3 }
    local result = replaceAtIndex(original, 4, 99)

    expect(result).toBe(original)
    expect(result).toEqual({ 1, 2, 3 })
end)

it('returns original empty array when trying to replace in empty array', function()
    local original = {}
    local result = replaceAtIndex(original, 1, 99)

    expect(result).toBe(original)
    expect(result).toEqual({})
end)

it('does not modify the original array', function()
    local original = { 1, 2, 3 }
    local result = replaceAtIndex(original, 2, 99)

    expect(original).toEqual({ 1, 2, 3 })
    expect(result).toEqual({ 1, 99, 3 })
    expect(result).never.toBe(original)
end)

it('returns original array when replacement value equals current value', function()
    local original = { 1, 2, 3 }
    local result = replaceAtIndex(original, 2, 2)

    expect(result).toBe(original)
    expect(result).toEqual({ 1, 2, 3 })
end)

it('works with complex objects', function()
    local players = {
        { name = 'Alice', score = 100 },
        { name = 'Bob', score = 85 },
        { name = 'Charlie', score = 92 },
    }

    local result = replaceAtIndex(players, 2, { name = 'Diana', score = 88 })

    expect(result).toEqual({
        { name = 'Alice', score = 100 },
        { name = 'Diana', score = 88 },
        { name = 'Charlie', score = 92 },
    })
end)

it('preserves array length', function()
    local original = { 1, 2, 3, 4, 5 }
    local result = replaceAtIndex(original, 3, 99)

    expect(#result).toEqual(#original)
    expect(#result).toEqual(5)
end)

it('handles single element array correctly', function()
    local result = replaceAtIndex({ 42 }, 1, 99)

    expect(result).toEqual({ 99 })
end)

it('works with large arrays', function()
    local largeArray = {}
    for i = 1, 100 do
        table.insert(largeArray, i)
    end

    local result = replaceAtIndex(largeArray, 50, 999)

    expect(#result).toEqual(100)
    expect(result[50]).toEqual(999)
    expect(result[49]).toEqual(49)
    expect(result[51]).toEqual(51)
end)

it('maintains correct indices after replacement', function()
    local result = replaceAtIndex({ 'a', 'b', 'c', 'd' }, 3, 'x')

    expect(result[1]).toEqual('a')
    expect(result[2]).toEqual('b')
    expect(result[3]).toEqual('x')
    expect(result[4]).toEqual('d')
end)

return nil
