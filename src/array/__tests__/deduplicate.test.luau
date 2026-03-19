local deduplicate = require('../deduplicate')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('returns the same array when empty', function()
    local empty = {}
    local result = deduplicate(empty)

    expect(result).toBe(empty)
end)

it('returns the same array when it has no duplicates', function()
    local array = { 'a', 'b', 'c', 'd' }
    local result = deduplicate(array)

    expect(result).toBe(array)
end)

it('removes a single duplicate element from the array', function()
    local array = { 'a', 'b', 'c', 'b', 'd' }
    local result = deduplicate(array)

    expect(result).toEqual({ 'a', 'b', 'c', 'd' })
end)

it('removes multiple duplicate elements from the array', function()
    local array = { 'a', 'b', 'c', 'b', 'd', 'a', 'c', 'd' }
    local result = deduplicate(array)

    expect(result).toEqual({ 'a', 'b', 'c', 'd' })
end)

it('handles mixed data types in the array', function()
    type Mixed = { number | string | boolean }
    local array: Mixed = { 1, 'hello', true, true, 'world', 42, 'hello', 1 }
    local result = deduplicate(array)

    expect(result).toEqual({ 1, 'hello', true, 'world', 42 } :: Mixed)
end)

return nil
