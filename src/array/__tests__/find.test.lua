local find = require('../find')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local jest = jestGlobals.jest
local expect = jestGlobals.expect
local it = jestGlobals.it

it('is nil for an empty array', function()
    local result = find({}, function(_)
        return true
    end)

    expect(result).toEqual(nil)
end)

it('returns the first element that satisfies the predicate', function()
    local result = find({ 1, 6, 5, 4 }, function(value)
        return value > 4
    end)

    expect(result).toEqual(6)
end)

it('returns the first element after the start index that satisfies the predicate', function()
    local result = find({ 1, 6, 5, 4 }, function(value)
        return value > 4
    end, 3)

    expect(result).toEqual(5)
end)

it('returns nil if no elements satisfy the predicate', function()
    local result = find({ 1, 6, 5, 4 }, function(value)
        return value > 10
    end)

    expect(result).toEqual(nil)
end)

it('stops calling the predicate as soon as one element satisfies the predicate', function()
    local predicate, predicateFn = jest.fn(function(value: number)
        return value % 2 ~= 0
    end)
    local result = find({ 4, 2, 5, 4 }, predicateFn)

    expect(result).toEqual(5)
    expect(predicate).toHaveBeenCalledTimes(3)
end)

return nil
