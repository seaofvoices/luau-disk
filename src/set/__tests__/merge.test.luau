local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local fromArray = require('../fromArray')
local merge = require('../merge')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('merges multiple sets into a single set', function()
    local set1 = fromArray({ 1, 2, 3 })
    local set2 = fromArray({ 3, 4, 5 })
    local set3 = fromArray({ 5, 6, 7 })

    local result = merge(set1, set2, set3)

    expect(result).toEqual(fromArray({ 1, 2, 3, 4, 5, 6, 7 }))
end)

it('handles empty sets', function()
    local set1 = fromArray({ 1, 2, 3 })
    local set2 = fromArray({})
    local set3 = fromArray({ 4, 5, 6 })

    local result = merge(set1, set2, set3)

    expect(result).toEqual(fromArray({ 1, 2, 3, 4, 5, 6 }))
end)

it('handles all empty sets', function()
    local result = merge(fromArray({}), fromArray({}), fromArray({}))

    expect(result).toEqual(fromArray({}))
end)

it('returns the same set if given one', function()
    local set = fromArray({ 1, 2, 3 })
    local result = merge(set)

    expect(result).toBe(set)
end)

it('returns the same set if given one and nil values', function()
    local set = fromArray({ 1, 2, 3 })
    local result = merge(nil, set, nil)

    expect(result).toBe(set)
end)

it('handles string values', function()
    local set1 = fromArray({ 'a', 'b', 'c' })
    local set2 = fromArray({ 'c', 'd', 'e' })

    local result = merge(set1, set2)

    expect(result).toEqual(fromArray({ 'a', 'b', 'c', 'd', 'e' }))
end)

return nil
