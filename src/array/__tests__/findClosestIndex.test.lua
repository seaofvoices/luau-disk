local findClosestIndex = require('../findClosestIndex')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('returns nil for an empty array', function()
    local result = findClosestIndex({}, 5)

    expect(result).toEqual(nil)
end)

it('returns 1 for a single element array', function()
    local result = findClosestIndex({ 10 }, 5)

    expect(result).toEqual(1)
end)

it('returns correct index for closest value with positive numbers', function()
    local result = findClosestIndex({ 1, 5, 3, 9, 7 }, 6)

    expect(result).toEqual(2) -- 5 is at index 2
end)

it('returns correct index with negative numbers', function()
    local result = findClosestIndex({ -10, -2, -5, -1 }, -3)

    expect(result).toEqual(2) -- -2 is at index 2
end)

it('returns correct index with mixed positive and negative numbers', function()
    local result = findClosestIndex({ -5, 10, 2, -1, 8 }, 0)

    expect(result).toEqual(4) -- -1 is at index 4
end)

it('handles ties by returning the first matching index', function()
    local result = findClosestIndex({ 3, 7, 5 }, 5)

    expect(result).toEqual(3) -- 5 is at index 3, exact match
end)

it('handles ties with equal distance by returning the first occurrence', function()
    local result = findClosestIndex({ 2, 8 }, 5)

    expect(result).toEqual(1) -- Both have distance 3, first wins
end)

it('returns correct index when target matches an element exactly', function()
    local result = findClosestIndex({ 1, 3, 5, 7, 9 }, 5)

    expect(result).toEqual(3) -- 5 is at index 3
end)

it('works with decimal numbers', function()
    local result = findClosestIndex({ 1.1, 2.7, 3.2, 4.8 }, 2.5)

    expect(result).toEqual(2) -- 2.7 is at index 2
end)

it('returns correct index with start parameter', function()
    local result = findClosestIndex({ 1, 5, 3, 9, 7 }, 6, 3)

    expect(result).toEqual(5) -- 7 is at index 5, starting from index 3
end)

it('respects start parameter and ignores earlier elements', function()
    local result = findClosestIndex({ 1, 5, 3, 9, 7 }, 2, 4)

    expect(result).toEqual(5) -- 7 is closest to 2 from index 4 onwards
end)

it('returns nil when start parameter is beyond array length', function()
    local result = findClosestIndex({ 1, 5, 3 }, 2, 5)

    expect(result).toEqual(nil)
end)

it('works when start parameter equals array length', function()
    local result = findClosestIndex({ 1, 5, 3 }, 2, 3)

    expect(result).toEqual(3) -- Only element 3 is considered
end)

it('treats nil start parameter as starting from beginning', function()
    local result = findClosestIndex({ 1, 5, 3, 9, 7 }, 6, nil)

    expect(result).toEqual(2) -- 5 is at index 2
end)

it('treats start parameter of 1 as starting from beginning', function()
    local result = findClosestIndex({ 1, 5, 3, 9, 7 }, 6, 1)

    expect(result).toEqual(2) -- 5 is at index 2
end)

it('handles very large numbers', function()
    local result = findClosestIndex({ 1000000, 5000000, 3000000 }, 2500000)

    expect(result).toEqual(3) -- 3000000 is at index 3
end)

it('returns first index when all elements are same distance', function()
    local result = findClosestIndex({ 3, 7 }, 5)

    expect(result).toEqual(1) -- Both have distance 2, first wins
end)

it('works with start parameter in middle of array', function()
    local result = findClosestIndex({ 10, 20, 30, 40, 50 }, 35, 3)

    expect(result).toEqual(3) -- 30 is closest to 35 starting from index 3
end)

it('returns correct index for last element when it is closest', function()
    local result = findClosestIndex({ 1, 2, 3, 4, 100 }, 99)

    expect(result).toEqual(5) -- 100 is at index 5
end)

it('returns correct index for first element when it is closest', function()
    local result = findClosestIndex({ 100, 1, 2, 3, 4 }, 99)

    expect(result).toEqual(1) -- 100 is at index 1
end)

return nil
