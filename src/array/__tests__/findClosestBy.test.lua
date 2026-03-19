local findClosestBy = require('../findClosestBy')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('returns nil for an empty array', function()
    local result = findClosestBy({}, function(x)
        return x
    end)

    expect(result).toEqual(nil)
end)

it('returns the only element in a single element array', function()
    local result = findClosestBy({ 10 }, function(x)
        return x - 5
    end)

    expect(result).toEqual(10)
end)

it('finds the closest element using custom distance function', function()
    local result = findClosestBy({ 1, 5, 3, 9, 7 }, function(x)
        return x - 6
    end)

    expect(result).toEqual(5)
end)

it('works with negative distance values', function()
    local result = findClosestBy({ -10, -2, -5, -1 }, function(x)
        return x + 3
    end)

    expect(result).toEqual(-2)
end)

it('works with complex object arrays', function()
    local players = {
        { name = 'Alice', score = 100 },
        { name = 'Bob', score = 85 },
        { name = 'Charlie', score = 92 },
        { name = 'Diana', score = 88 },
    }

    local result = findClosestBy(players, function(player)
        return player.score - 90
    end)

    expect(result).toEqual({ name = 'Charlie', score = 92 })
end)

it('handles ties by returning the first match found', function()
    local result = findClosestBy({ 3, 7 }, function(x)
        return x - 5
    end)

    expect(result).toEqual(3)
end)

it('finds closest element when distance is exactly zero', function()
    local result = findClosestBy({ 1, 3, 5, 7, 9 }, function(x)
        return x - 5
    end)

    expect(result).toEqual(5)
end)

it('works with decimal distance calculations', function()
    local result = findClosestBy({ 1.1, 2.7, 3.2, 4.8 }, function(x)
        return x - 2.5
    end)

    expect(result).toEqual(2.7)
end)

it('finds closest element with start parameter', function()
    local result = findClosestBy({ 1, 5, 3, 9, 7 }, function(x)
        return x - 6
    end, 3)

    expect(result).toEqual(7)
end)

it('respects start parameter and ignores earlier elements', function()
    local result = findClosestBy({ 1, 5, 3, 9, 7 }, function(x)
        return x - 2
    end, 4)

    expect(result).toEqual(7)
end)

it('returns nil when start parameter is beyond array length', function()
    local result = findClosestBy({ 1, 5, 3 }, function(x)
        return x - 2
    end, 5)

    expect(result).toEqual(nil)
end)

it('works when start parameter equals array length', function()
    local result = findClosestBy({ 1, 5, 3 }, function(x)
        return x - 2
    end, 3)

    expect(result).toEqual(3)
end)

it('treats nil start parameter as starting from beginning', function()
    local result = findClosestBy({ 1, 5, 3, 9, 7 }, function(x)
        return x - 6
    end, nil)

    expect(result).toEqual(5)
end)

it('treats start parameter of 1 as starting from beginning', function()
    local result = findClosestBy({ 1, 5, 3, 9, 7 }, function(x)
        return x - 6
    end, 1)

    expect(result).toEqual(5)
end)

it('calls distance function correctly for each element', function()
    local callCount = 0
    local calledValues = {}

    findClosestBy({ 10, 20, 30 }, function(x)
        callCount = callCount + 1
        table.insert(calledValues, x)
        return x - 25
    end)

    expect(callCount).toEqual(3)
    expect(calledValues).toEqual({ 10, 20, 30 })
end)

it('uses absolute value of distance function result', function()
    -- Elements with negative and positive distances, but same absolute value
    local result = findClosestBy({ 3, 7 }, function(x)
        return x - 5
    end)

    expect(result).toEqual(3) -- Both have distance of 2, first one wins
end)

it('works with string distance calculations', function()
    local words = { 'cat', 'dog', 'bird', 'fish' }

    local result = findClosestBy(words, function(word)
        return #word - 3
    end)

    expect(result).toEqual('cat') -- Length 3, distance 0
end)

it('handles very large distance values', function()
    local result = findClosestBy({ 1000000, 5000000, 3000000 }, function(x)
        return x - 2500000
    end)

    expect(result).toEqual(3000000)
end)

it('works with function that returns zero for all elements', function()
    local result = findClosestBy({ 1, 2, 3 }, function(x)
        return 0
    end)

    expect(result).toEqual(1) -- All have same distance, first wins
end)

return nil
