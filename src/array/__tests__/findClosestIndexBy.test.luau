local findClosestIndexBy = require('../findClosestIndexBy')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('returns nil for an empty array', function()
    local result = findClosestIndexBy({}, function(x)
        return x
    end)

    expect(result).toEqual(nil)
end)

it('returns 1 for a single element array', function()
    local result = findClosestIndexBy({ 10 }, function(x)
        return x - 5
    end)

    expect(result).toEqual(1)
end)

it('returns correct index with custom distance function', function()
    local result = findClosestIndexBy({ 1, 5, 3, 9, 7 }, function(x)
        return x - 6
    end)

    expect(result).toEqual(2)
end)

it('handles ties by returning the first matching index', function()
    local result = findClosestIndexBy({ 3, 7 }, function(x)
        return x - 5
    end)

    expect(result).toEqual(1)
end)

it('returns correct index when distance is exactly zero', function()
    local result = findClosestIndexBy({ 1, 3, 5, 7, 9 }, function(x)
        return x - 5
    end)

    expect(result).toEqual(3) -- 5 is at index 3
end)

it('returns correct index with start parameter', function()
    local result = findClosestIndexBy({ 1, 5, 3, 9, 7 }, function(x)
        return x - 6
    end, 3)

    expect(result).toEqual(5)
end)

it('returns nil when start parameter is beyond array length', function()
    local result = findClosestIndexBy({ 1, 5, 3 }, function(x)
        return x - 2
    end, 5)

    expect(result).toEqual(nil)
end)

it('works when start parameter equals array length', function()
    local result = findClosestIndexBy({ 1, 5, 8 }, function(x)
        return x - 2
    end, 3)

    expect(result).toEqual(3) -- Only element at index 3 is considered
end)

it('calls distance function correctly for each element', function()
    local callCount = 0
    local calledValues = {}

    findClosestIndexBy({ 10, 20, 30 }, function(x)
        callCount = callCount + 1
        table.insert(calledValues, x)
        return x - 25
    end)

    expect(callCount).toEqual(3)
    expect(calledValues).toEqual({ 10, 20, 30 })
end)

it('uses absolute value of distance function result', function()
    local result = findClosestIndexBy({ 3, 7 }, function(x)
        return 5 - x
    end)

    expect(result).toEqual(1)
end)

it('works with function that returns zero for all elements', function()
    local result = findClosestIndexBy({ 1, 2, 3 }, function(_)
        return 0
    end)

    expect(result).toEqual(1) -- All have same distance, first wins
end)

return nil
