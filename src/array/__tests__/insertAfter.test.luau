local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local insertAfter = require('../insertAfter')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('inserts after first matching element', function()
    local result = insertAfter({ 1, 2, 3, 4 }, 99, function(x)
        return x == 2
    end)

    expect(result).toEqual({ 1, 2, 99, 3, 4 })
end)

it('inserts after last element correctly when match is at end', function()
    local result = insertAfter({ 1, 2, 3, 4 }, 99, function(x)
        return x == 4
    end)

    expect(result).toEqual({ 1, 2, 3, 4, 99 })
end)

it('returns original array when no match is found', function()
    local original = { 1, 2, 3 }
    local result = insertAfter(original, 99, function(x)
        return x == 5
    end)

    expect(result).toEqual({ 1, 2, 3 })
    expect(result).toBe(original)
end)

it('returns empty array unchanged when no match is found', function()
    local original = {}
    local result = insertAfter(original, 99, function(x)
        return x == 1
    end)

    expect(result).toEqual({})
    expect(result).toBe(original)
end)

it('uses first match when multiple elements match', function()
    local result = insertAfter({ 1, 2, 2, 3 }, 99, function(x)
        return x == 2
    end)

    expect(result).toEqual({ 1, 2, 99, 2, 3 })
end)

it('works with start parameter to limit search', function()
    local result = insertAfter({ 1, 2, 3, 2, 4 }, 99, function(x)
        return x == 2
    end, 3)

    expect(result).toEqual({ 1, 2, 3, 2, 99, 4 })
end)

it('returns original array when there is no match after the start parameter', function()
    local original = { 5, 1, 2, 3 }
    local result = insertAfter(original, 99, function(x)
        return x == 1
    end, 3)

    expect(result).toEqual({ 5, 1, 2, 3 })
    expect(result).toBe(original)
end)

it('does not modify the original array', function()
    local original = { 1, 2, 3 }
    local result = insertAfter(original, 99, function(x)
        return x == 2
    end)

    expect(original).toEqual({ 1, 2, 3 })
    expect(result).toEqual({ 1, 2, 99, 3 })
    expect(result).never.toBe(original)
end)

it('calls predicate with correct arguments', function()
    local callCount = 0
    local calledValues = {}

    insertAfter({ 10, 20, 30 }, 99, function(x)
        callCount = callCount + 1
        table.insert(calledValues, x)
        return x == 20
    end)

    expect(callCount).toEqual(2)
    expect(calledValues).toEqual({ 10, 20 })
end)

it('stops calling predicate after first match is found', function()
    local callCount = 0

    insertAfter({ 1, 2, 2, 3 }, 99, function(x)
        callCount = callCount + 1
        return x == 2
    end)

    expect(callCount).toEqual(2)
end)

it('works with nil start parameter', function()
    local result = insertAfter({ 1, 2, 3 }, 99, function(x)
        return x == 2
    end, nil)

    expect(result).toEqual({ 1, 2, 99, 3 })
end)

it('works with start parameter of 1', function()
    local result = insertAfter({ 1, 2, 3 }, 99, function(x)
        return x == 2
    end, 1)

    expect(result).toEqual({ 1, 2, 99, 3 })
end)

it('works when start parameter equals array length', function()
    local result = insertAfter({ 1, 2, 3 }, 99, function(x)
        return x == 3
    end, 3)

    expect(result).toEqual({ 1, 2, 3, 99 })
end)

it('returns original array when start parameter is beyond array length and no match', function()
    local original = { 1, 2, 3 }
    local result = insertAfter(original, 99, function(x)
        return x == 1
    end, 5)

    expect(result).toEqual({ 1, 2, 3 })
    expect(result).toBe(original)
end)

return nil
