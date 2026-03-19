local findClosest = require('../findClosest')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('returns nil for an empty array', function()
    local result = findClosest({}, 5)

    expect(result).toEqual(nil)
end)

it('returns the only element in a single element array', function()
    local result = findClosest({ 10 }, 5)

    expect(result).toEqual(10)
end)

it('finds the closest value to target with positive numbers', function()
    local result = findClosest({ 1, 5, 3, 9, 7 }, 6)

    expect(result).toEqual(5)
end)

it('finds the closest value with negative numbers', function()
    local result = findClosest({ -10, -2, -5, -1 }, -3)

    expect(result).toEqual(-2)
end)

it('finds the closest value with mixed positive and negative numbers', function()
    local result = findClosest({ -5, 10, 2, -1, 8 }, 0)

    expect(result).toEqual(-1)
end)

it('handles ties by returning the first match found', function()
    local result = findClosest({ 3, 7, 5 }, 5)

    expect(result).toEqual(5)
end)

it('handles ties with equal distance by returning the first occurrence', function()
    local result = findClosest({ 2, 8 }, 5)

    expect(result).toEqual(2)
end)

it('finds closest value when target matches an element exactly', function()
    local result = findClosest({ 1, 3, 5, 7, 9 }, 5)

    expect(result).toEqual(5)
end)

it('works with decimal numbers', function()
    local result = findClosest({ 1.1, 2.7, 3.2, 4.8 }, 2.5)

    expect(result).toEqual(2.7)
end)

it('finds closest value with start parameter', function()
    local result = findClosest({ 1, 5, 3, 9, 7 }, 6, 3)

    expect(result).toEqual(7)
end)

it('respects start parameter and ignores earlier elements', function()
    local result = findClosest({ 1, 5, 3, 9, 7 }, 2, 4)

    expect(result).toEqual(7)
end)

it('returns nil when start parameter is beyond array length', function()
    local result = findClosest({ 1, 5, 3 }, 2, 5)

    expect(result).toEqual(nil)
end)

it('works when start parameter equals array length', function()
    local result = findClosest({ 1, 5, 3 }, 2, 3)

    expect(result).toEqual(3)
end)

it('treats nil start parameter as starting from beginning', function()
    local result = findClosest({ 1, 5, 3, 9, 7 }, 6, nil)

    expect(result).toEqual(5)
end)

it('treats start parameter of 1 as starting from beginning', function()
    local result = findClosest({ 1, 5, 3, 9, 7 }, 6, 1)

    expect(result).toEqual(5)
end)

it('handles very large numbers', function()
    local result = findClosest({ 1000000, 5000000, 3000000 }, 2500000)

    expect(result).toEqual(3000000)
end)

it('finds closest when all elements are same distance', function()
    local result = findClosest({ 3, 7 }, 5)

    expect(result).toEqual(3)
end)

return nil
