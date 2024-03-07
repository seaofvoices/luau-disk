local findMap = require('../findMap')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local jest = jestGlobals.jest
local expect = jestGlobals.expect
local it = jestGlobals.it

it('is nil for an empty array', function()
    local result = findMap({}, function(_)
        return true
    end)

    expect(result).toEqual(nil)
end)

it('returns the first element where the map function does not return nil', function()
    local result = findMap({ 1, 6, 5, 4 }, function(value)
        return if value > 4 then value * 2 else nil
    end)

    expect(result).toEqual(12)
end)

it(
    'returns the first element where the map function does not return nil after the start index',
    function()
        local result = findMap({ 1, 6, 5, 4 }, function(value)
            return if value > 4 then value * 2 else nil
        end, 3)

        expect(result).toEqual(10)
    end
)

it('returns nil if the map function always returns nil', function()
    local result = findMap({ 1, 6, 5, 4 }, function(_value)
        return nil
    end)

    expect(result).toEqual(nil)
end)

it('stops calling the predicate as soon as the map function does not return nil', function()
    local predicate, predicateFn = jest.fn(function(value: number)
        return if value % 2 ~= 0 then value * 2 else nil
    end)
    local result = findMap({ 4, 2, 5, 4 }, predicateFn)

    expect(result).toEqual(10)
    expect(predicate).toHaveBeenCalledTimes(3)
end)

return nil
