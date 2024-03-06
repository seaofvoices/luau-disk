local findIndex = require('../findIndex')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local jest = jestGlobals.jest
local expect = jestGlobals.expect
local it = jestGlobals.it

it('is nil for an empty array', function()
    local result = findIndex({}, function(_)
        return true
    end)

    expect(result).toEqual(nil)
end)

it('returns the index of the first element that satisfies the predicate', function()
    local result = findIndex({ 1, 6, 5, 4 }, function(value)
        return value > 4
    end)

    expect(result).toEqual(2)
end)

it(
    'returns the index of the first element after the start index that satisfies the predicate',
    function()
        local result = findIndex({ 1, 6, 5, 4 }, function(value)
            return value > 4
        end, 3)

        expect(result).toEqual(3)
    end
)

it('returns nil if no elements satisfy the predicate', function()
    local result = findIndex({ 1, 6, 5, 4 }, function(value)
        return value > 10
    end)

    expect(result).toEqual(nil)
end)

it('stops calling the predicate as soon as one element satisfies the predicate', function()
    local predicate, predicateFn = jest.fn(function(value: number)
        return value % 2 ~= 0
    end)
    local result = findIndex({ 4, 2, 5, 4 }, predicateFn)

    expect(result).toEqual(3)
    expect(predicate).toHaveBeenCalledTimes(3)
end)

return nil
