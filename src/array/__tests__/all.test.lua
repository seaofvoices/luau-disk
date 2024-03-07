local all = require('../all')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local jest = jestGlobals.jest
local expect = jestGlobals.expect
local it = jestGlobals.it

it('is true for an empty array', function()
    local result = all({}, function(_value)
        return false
    end)

    expect(result).toEqual(true)
end)

it('is true if all elements satisfies the predicate', function()
    local result = all({ 1, 6, 5, 4 }, function(value)
        return value < 10
    end)

    expect(result).toEqual(true)
end)

it('is false if one element does not satisfy the predicate', function()
    local result = all({ 1, 6, 5, 4 }, function(value)
        return value < 6
    end)

    expect(result).toEqual(false)
end)

it('stops calling the predicate as soon as one element does not satisfy the predicate', function()
    local predicate, predicateFn = jest.fn(function(value: number)
        return value % 2 == 0
    end)
    local result = all({ 4, 2, 5, 4 }, predicateFn)

    expect(result).toEqual(false)
    expect(predicate).toHaveBeenCalledTimes(3)
end)

return nil
