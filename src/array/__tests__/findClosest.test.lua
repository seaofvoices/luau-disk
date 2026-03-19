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

it('handles ties by returning the first match found', function()
    local result = findClosest({ 1, 5, 3, 9, 7 }, 6)

    expect(result).toEqual(5)
end)

it('finds the closest value with negative numbers', function()
    local result = findClosest({ -10, -2, -5, -1 }, -3)

    expect(result).toEqual(-2)
end)

it('finds closest value when target matches an element exactly', function()
    local result = findClosest({ 1, 3, 5, 7, 9 }, 5)

    expect(result).toEqual(5)
end)

it('finds closest value with start parameter', function()
    local result = findClosest({ 1, 6, 3, 9, 7 }, 6, 3)

    expect(result).toEqual(7)
end)

it('returns nil when start parameter is beyond array length', function()
    local result = findClosest({ 1, 5, 3 }, 2, 5)

    expect(result).toEqual(nil)
end)

it('works when start parameter equals array length', function()
    local result = findClosest({ 1, 5, 3 }, 5, 3)

    expect(result).toEqual(3)
end)

return nil
