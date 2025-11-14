local fromArray = require('../fromArray')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local map = require('../map')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('transforms each value in the set', function()
    local set = fromArray({ 1, 2, 3, 4, 5 })
    local result = map(set, function(value)
        return value * 2
    end)

    expect(result).toEqual(fromArray({ 2, 4, 6, 8, 10 }))
end)

it('handles empty set', function()
    local set = fromArray({})
    local result = map(set, function(value: number)
        return value * 2
    end)

    expect(result).toEqual(fromArray({}))
end)

it('transforms to different type', function()
    local set = fromArray({ 1, 2, 3, 4, 5 })
    local result = map(set, function(value)
        return tostring(value)
    end)

    expect(result).toEqual(fromArray({ '1', '2', '3', '4', '5' }))
end)

it('preserves order of elements', function()
    local set = fromArray({ 5, 3, 1, 4, 2 })
    local result = map(set, function(value)
        return value
    end)

    expect(result).toEqual(fromArray({ 5, 3, 1, 4, 2 }))
end)

it('removes entries when mapping function returns nil', function()
    local set = fromArray({ 1, 2, 3, 4, 5 })
    local result = map(set, function(value)
        if value % 2 == 0 then
            return nil
        end
        return value * 2
    end)

    expect(result).toEqual(fromArray({ 2, 6, 10 }))
end)

return nil
