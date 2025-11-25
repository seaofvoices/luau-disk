local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local reverseFindMap = require('../reverseFindMap')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('returns the first non-nil mapped value from the end', function()
    local array = { 1, 2, 3, 4, 5 }
    local result = reverseFindMap(array, function(element)
        if element % 2 == 0 then
            return element * 2
        end
        return nil
    end)

    expect(result).toBe(8)
end)

it('returns nil when no mapped value is non-nil', function()
    local array = { 1, 3, 5, 7, 9 }
    local result = reverseFindMap(array, function(element)
        if element % 2 == 0 then
            return element * 2
        end
        return nil
    end)

    expect(result).toBe(nil)
end)

it('starts from the given index', function()
    local array = { 1, 2, 3, 4, 5 }
    local result = reverseFindMap(array, function(element)
        if element % 2 == 0 then
            return element * 2
        end
        return nil
    end, 3)

    expect(result).toBe(4)
end)

it('handles empty array', function()
    local array = {}
    local result = reverseFindMap(array, function(element)
        return element
    end)

    expect(result).toBe(nil)
end)

return nil
