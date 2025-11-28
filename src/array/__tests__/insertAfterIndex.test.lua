local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local insertAfterIndex = require('../insertAfterIndex')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('inserts after valid index', function()
    local result = insertAfterIndex({ 1, 2, 3, 4 }, 99, 2)

    expect(result).toEqual({ 1, 2, 99, 3, 4 })
end)

it('inserts after first element', function()
    local result = insertAfterIndex({ 1, 2, 3 }, 99, 1)

    expect(result).toEqual({ 1, 99, 2, 3 })
end)

it('inserts after last element (appends to end)', function()
    local result = insertAfterIndex({ 1, 2, 3 }, 99, 3)

    expect(result).toEqual({ 1, 2, 3, 99 })
end)

it('inserts at beginning when index < 1', function()
    local result = insertAfterIndex({ 1, 2, 3 }, 99, 0)

    expect(result).toEqual({ 99, 1, 2, 3 })
end)

it('inserts at beginning when index is negative', function()
    local result = insertAfterIndex({ 1, 2, 3 }, 99, -5)

    expect(result).toEqual({ 99, 1, 2, 3 })
end)

it('appends to end when index > length', function()
    local result = insertAfterIndex({ 1, 2, 3 }, 99, 10)

    expect(result).toEqual({ 1, 2, 3, 99 })
end)

it('appends to end when index equals length + 1', function()
    local result = insertAfterIndex({ 1, 2, 3 }, 99, 4)

    expect(result).toEqual({ 1, 2, 3, 99 })
end)

it('handles empty array by appending element', function()
    local result = insertAfterIndex({}, 99, 1)

    expect(result).toEqual({ 99 })
end)

it('handles empty array with index 0', function()
    local result = insertAfterIndex({}, 99, 0)

    expect(result).toEqual({ 99 })
end)

it('does not modify the original array', function()
    local original = { 1, 2, 3 }
    local result = insertAfterIndex(original, 99, 2)

    expect(original).toEqual({ 1, 2, 3 })
    expect(result).toEqual({ 1, 2, 99, 3 })
    expect(result).never.toBe(original)
end)

it('handles single element array correctly', function()
    local result = insertAfterIndex({ 42 }, 99, 1)

    expect(result).toEqual({ 42, 99 })
end)

it('handles single element array with index 0', function()
    local result = insertAfterIndex({ 42 }, 99, 0)

    expect(result).toEqual({ 99, 42 })
end)

return nil
