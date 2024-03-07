local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local takeWhile = require('../takeWhile')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('returns the same array if it is empty', function()
    local original = {}
    local result = takeWhile(original, function()
        return true
    end)

    expect(result).toBe(original)
end)

it('takes elements while the predicate is true', function()
    local result = takeWhile({ 2, 1, 1, 4, 5 }, function(element)
        return element <= 3
    end)

    expect(result).toEqual({ 2, 1, 1 })
end)

it('takes elements starting from a specified index while the predicate is true', function()
    local result = takeWhile({ 1, 2, 3, 4, 5 }, function(element)
        return element <= 4
    end, 3)

    expect(result).toEqual({ 3, 4 })
end)

it('takes no elements if predicate is false for the first element', function()
    local result = takeWhile({ 1, 2, 3, 4, 5 }, function(_element)
        return false
    end)

    expect(result).toEqual({})
end)

it('returns the same array if the predicate is true for all elements', function()
    local original = { 1, 2, 3, 4, 5 }
    local result = takeWhile(original, function(element)
        return element < 6
    end)

    expect(result).toBe(original)
end)

it('returns an empty array if start is beyond array length', function()
    local result = takeWhile({ 1, 2, 3, 4, 5 }, function(element)
        return element < 6
    end, 10)

    expect(result).toEqual({})
end)

return nil
