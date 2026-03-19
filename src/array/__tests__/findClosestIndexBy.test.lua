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

    expect(result).toEqual(2) -- 5 is at index 2, closest to 6
end)

it('works with negative distance values', function()
    local result = findClosestIndexBy({ -10, -2, -5, -1 }, function(x)
        return x + 3
    end)

    expect(result).toEqual(2) -- -2 is at index 2
end)

it('works with complex object arrays', function()
    local players = {
        { name = 'Alice', score = 100 },
        { name = 'Bob', score = 85 },
        { name = 'Charlie', score = 92 },
        { name = 'Diana', score = 88 },
    }

    local result = findClosestIndexBy(players, function(player)
        return player.score - 90
    end)

    expect(result).toEqual(3) -- Charlie is at index 3
end)

it('handles ties by returning the first matching index', function()
    local result = findClosestIndexBy({ 3, 7 }, function(x)
        return x - 5
    end)

    expect(result).toEqual(1) -- Both have distance 2, first wins
end)

it('returns correct index when distance is exactly zero', function()
    local result = findClosestIndexBy({ 1, 3, 5, 7, 9 }, function(x)
        return x - 5
    end)

    expect(result).toEqual(3) -- 5 is at index 3
end)

it('works with decimal distance calculations', function()
    local result = findClosestIndexBy({ 1.1, 2.7, 3.2, 4.8 }, function(x)
        return x - 2.5
    end)

    expect(result).toEqual(2) -- 2.7 is at index 2
end)

it('returns correct index with start parameter', function()
    local result = findClosestIndexBy({ 1, 5, 3, 9, 7 }, function(x)
        return x - 6
    end, 3)

    expect(result).toEqual(5) -- 7 is at index 5, starting from index 3
end)

it('respects start parameter and ignores earlier elements', function()
    local result = findClosestIndexBy({ 1, 5, 3, 9, 7 }, function(x)
        return x - 2
    end, 4)

    expect(result).toEqual(5) -- 7 is closest from index 4 onwards
end)

it('returns nil when start parameter is beyond array length', function()
    local result = findClosestIndexBy({ 1, 5, 3 }, function(x)
        return x - 2
    end, 5)

    expect(result).toEqual(nil)
end)

it('works when start parameter equals array length', function()
    local result = findClosestIndexBy({ 1, 5, 3 }, function(x)
        return x - 2
    end, 3)

    expect(result).toEqual(3) -- Only element at index 3 is considered
end)

it('treats nil start parameter as starting from beginning', function()
    local result = findClosestIndexBy({ 1, 5, 3, 9, 7 }, function(x)
        return x - 6
    end, nil)

    expect(result).toEqual(2) -- 5 is at index 2
end)

it('treats start parameter of 1 as starting from beginning', function()
    local result = findClosestIndexBy({ 1, 5, 3, 9, 7 }, function(x)
        return x - 6
    end, 1)

    expect(result).toEqual(2) -- 5 is at index 2
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
    -- Elements with negative and positive distances, but same absolute value
    local result = findClosestIndexBy({ 3, 7 }, function(x)
        return x - 5
    end)

    expect(result).toEqual(1) -- Both have distance of 2, first one wins
end)

it('works with string distance calculations', function()
    local words = { 'cat', 'dog', 'bird', 'fish' }

    local result = findClosestIndexBy(words, function(word)
        return #word - 3
    end)

    expect(result).toEqual(1) -- "cat" is at index 1, length 3, distance 0
end)

it('handles very large distance values', function()
    local result = findClosestIndexBy({ 1000000, 5000000, 3000000 }, function(x)
        return x - 2500000
    end)

    expect(result).toEqual(3) -- 3000000 is at index 3
end)

it('works with function that returns zero for all elements', function()
    local result = findClosestIndexBy({ 1, 2, 3 }, function(x)
        return 0
    end)

    expect(result).toEqual(1) -- All have same distance, first wins
end)

it('returns correct index for last element when it is closest', function()
    local result = findClosestIndexBy({ 1, 2, 3, 4, 100 }, function(x)
        return x - 99
    end)

    expect(result).toEqual(5) -- 100 is at index 5
end)

it('returns correct index for first element when it is closest', function()
    local result = findClosestIndexBy({ 100, 1, 2, 3, 4 }, function(x)
        return x - 99
    end)

    expect(result).toEqual(1) -- 100 is at index 1
end)

it('works with start parameter in middle of array', function()
    local result = findClosestIndexBy({ 10, 20, 30, 40, 50 }, function(x)
        return x - 35
    end, 3)

    expect(result).toEqual(3) -- 30 is closest to 35 starting from index 3
end)

return nil
