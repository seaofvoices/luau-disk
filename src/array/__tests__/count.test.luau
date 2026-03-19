local count = require('../count')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('returns 0 for an empty array', function()
    local result = count({})

    expect(result).toEqual(0)
end)

it('returns array length when no predicate is provided', function()
    local result = count({ 1, 2, 3, 4, 5 })

    expect(result).toEqual(5)
end)

it('counts only elements that match the predicate', function()
    local result = count({ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }, function(value: number)
        return value % 2 == 0
    end)

    expect(result).toEqual(5)
end)

it('returns 0 when no elements match the predicate', function()
    local result = count({ 1, 2, 3, 4, 5 }, function(value: number)
        return value > 10
    end)

    expect(result).toEqual(0)
end)

it('returns array length when predicate always returns true', function()
    local result = count({ 1, 2, 3, 4, 5 }, function(_value: number)
        return true
    end)

    expect(result).toEqual(5)
end)

it('counts string values with more than 5 characters', function()
    local result = count(
        { 'apple', 'banana', 'cherry', 'date', 'elderberry' },
        function(value: string)
            return #value > 5
        end
    )

    expect(result).toEqual(3)
end)

return nil
