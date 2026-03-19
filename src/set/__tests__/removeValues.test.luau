local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local fromArray = require('../fromArray')
local removeValues = require('../removeValues')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('removes single value from set', function()
    local set = fromArray({ 1, 2, 3, 4, 5 })
    local result = removeValues(set, 3)

    expect(result).toEqual(fromArray({ 1, 2, 4, 5 }))
end)

it('removes multiple values from set', function()
    local set = fromArray({ 1, 2, 3, 4, 5 })
    local result = removeValues(set, 2, 4)

    expect(result).toEqual(fromArray({ 1, 3, 5 }))
end)

it('returns original set when no values to remove', function()
    local set = fromArray({ 1, 2, 3, 4, 5 })
    local result = removeValues(set)

    expect(result).toEqual(fromArray({ 1, 2, 3, 4, 5 }))
end)

it('returns original set when set is empty', function()
    local set = fromArray({})
    local result = removeValues(set, 1, 2, 3)

    expect(result).toBe(set)
end)

it('returns original set when values to remove are not in set', function()
    local set = fromArray({ 1, 2, 3, 4, 5 })
    local result = removeValues(set, 6, 7, 8)

    expect(result).toBe(set)
end)

it('handles nil values in remove list', function()
    local set = fromArray({ 1, 2, 3, 4, 5 })
    local result = removeValues(set, 2, nil, 4)

    expect(result).toEqual(fromArray({ 1, 3, 5 }))
end)

return nil
