local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local filter = require('../filter')
local fromArray = require('../fromArray')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('filters elements based on predicate', function()
    local set = fromArray({ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 })
    local result = filter(set, function(value: number)
        return value % 2 == 0
    end)

    expect(result).toEqual(fromArray({ 2, 4, 6, 8, 10 }))
end)

it('handles empty set', function()
    local set = fromArray({})
    local result = filter(set, function(value: number)
        return value > 5
    end)

    expect(result).toEqual(fromArray({}))
end)

it('returns empty set when no elements match predicate', function()
    local set = fromArray({ 1, 2, 3, 4, 5 })
    local result = filter(set, function(value: number)
        return value > 10
    end)

    expect(result).toEqual(fromArray({}))
end)

it('returns all elements when predicate always returns true', function()
    local set = fromArray({ 1, 2, 3, 4, 5 })
    local result = filter(set, function(_value: number)
        return true
    end)

    expect(result).toEqual(fromArray({ 1, 2, 3, 4, 5 }))
end)

it('works with string values', function()
    local set = fromArray({ 'apple', 'banana', 'cherry', 'date', 'elderberry' })
    local result = filter(set, function(value: string)
        return #value > 5
    end)

    expect(result).toEqual(fromArray({ 'banana', 'cherry', 'elderberry' }))
end)

return nil
