local any = require('../any')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local jest = jestGlobals.jest
local expect = jestGlobals.expect
local it = jestGlobals.it

it('is false for an empty array', function()
    local result = any({}, function(_value)
        return true
    end)

    expect(result).toEqual(false)
end)

it('is false if all element are false', function()
    local result = any({ 1, 2, 3, 4 }, function(_value)
        return false
    end)

    expect(result).toEqual(false)
end)

it('is true if any element satisfies the predicate', function()
    local result = any({ 1, 6, 5, 4 }, function(value)
        return value % 2 == 0
    end)

    expect(result).toEqual(true)
end)

it('is true if the last element satisfies the predicate', function()
    local result = any({ 1, 7, 5, 4 }, function(value)
        return value % 2 == 0
    end)

    expect(result).toEqual(true)
end)

it('calls the predicate with the indexes', function()
    local result = any({ true, false, false }, function(_value, index)
        return index == 2
    end)

    expect(result).toEqual(true)
end)

it('stops calling the predicate as soon as one element satisfies the predicate', function()
    local predicate, predicateFn = jest.fn(function(value: number)
        return value % 2 == 0
    end)
    local result = any({ 1, 2, 5, 4 }, predicateFn)

    expect(result).toEqual(true)
    expect(predicate).toHaveBeenCalledTimes(2)
end)

return nil
