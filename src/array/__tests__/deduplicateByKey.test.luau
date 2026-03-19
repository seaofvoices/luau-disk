local deduplicateByKey = require('../deduplicateByKey')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local expect = jestGlobals.expect
local it = jestGlobals.it

local function getId<T>(object: { id: T }): T
    return object.id
end

it('returns the same array when empty', function()
    local empty = {}
    local result = deduplicateByKey(empty, getId)

    expect(result).toBe(empty)
end)

it('returns the same array when it has no duplicates based on the key', function()
    local array = { { id = 1, value = 'a' }, { id = 2, value = 'b' }, { id = 3, value = 'c' } }
    local result = deduplicateByKey(array, getId)

    expect(result).toBe(array)
end)

it('removes a single duplicate element based on the key', function()
    local a = { id = 1, value = 'a' }
    local b = { id = 2, value = 'b' }
    local c = { id = 1, value = 'c' }
    local array = { a, b, c }
    local result = deduplicateByKey(array, getId)

    expect(result).toEqual({ a, b })
end)

it('removes multiple duplicate elements based on the key', function()
    local array = { 'a', 'b', 'aa', '12', '123' }
    local result = deduplicateByKey(array, function(str)
        return #str
    end)

    expect(result).toEqual({ 'a', 'aa', '123' })
end)

it('keeps the first element if they all map to the same key', function()
    local array = { 'a', 'b', 'c', 'd', 'e' }
    local result = deduplicateByKey(array, function(str)
        return #str
    end)

    expect(result).toEqual({ 'a' })
end)
