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
    local result = findClosestIndex({ 1, 5, 3, 9, 11 }, 6)

    expect(result).toEqual(2)
end)

it('handles ties by returning the first matching index', function()
    local result = findClosestIndex({ 2, 8 }, 5)

    expect(result).toEqual(1)
end)

it('returns correct index when target matches an element exactly', function()
    local result = findClosestIndex({ 1, 3, 5, 7, 9 }, 5)

    expect(result).toEqual(3)
end)

it('respects start parameter and ignores earlier elements', function()
    local result = findClosestIndex({ 1, 5, 3, 9, 7 }, 2, 4)

    expect(result).toEqual(5)
end)

it('returns nil when start parameter is beyond array length', function()
    local result = findClosestIndex({ 1, 5, 3 }, 2, 5)

    expect(result).toEqual(nil)
end)

it('works when start parameter equals array length', function()
    local result = findClosestIndex({ 1, 5, 3 }, 2, 3)

    expect(result).toEqual(3)
end)

return nil
