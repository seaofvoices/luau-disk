local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local reverseFindIndex = require('../reverseFindIndex')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('finds the index of the last element matching the predicate', function()
    local array = { 1, 2, 3, 4, 5 }
    local result = reverseFindIndex(array, function(element)
        return element % 2 == 0
    end)

    expect(result).toBe(4)
end)

it('returns nil when no element matches', function()
    local array = { 1, 3, 5, 7, 9 }
    local result = reverseFindIndex(array, function(element)
        return element % 2 == 0
    end)

    expect(result).toBe(nil)
end)

it('starts from the given index', function()
    local array = { 1, 2, 3, 4, 5 }
    local result = reverseFindIndex(array, function(element)
        return element % 2 == 0
    end, 3)

    expect(result).toBe(2)
end)

it('handles empty array', function()
    local array = {}
    local result = reverseFindIndex(array, function(element)
        return true
    end)

    expect(result).toBe(nil)
end)

return nil
