local flatten = require('../flatten')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('flattens two arrays of boolean', function()
    local result = flatten({ { true }, { false } })

    expect(result).toEqual({ true, false })
end)

it('flattens nested arrays of numbers', function()
    local result = flatten({
        1 :: any,
        { { 1, 2 }, { 3 } },
        { { 4 } :: any, { 5 }, 6 },
    })

    expect(result).toEqual({ 1, 1, 2, 3, 4, 5, 6 })
end)

it('flattens one array of boolean and a string', function()
    local result = flatten({ 'test' :: any, { false } })

    expect(result).toEqual({ 'test' :: any, false })
end)

it('flattens one level of empty arrays', function()
    local result = flatten({ {}, {}, {} })

    expect(result).toEqual({})
end)

it('flattens multiple levels of empty arrays', function()
    local result = flatten({ {}, { {}, { {} } }, { { { {} } }, { {} } } })

    expect(result).toEqual({})
end)

it('flattens one level of nested arrays', function()
    local result = flatten({ 1, { 2, { 3, 4 } :: any }, 5 }, 1)
    expect(result).toEqual({ 1, 2, { 3, 4 } :: any, 5 })
end)

it('flattens two levels of nested arrays', function()
    local deepNestedArray = { 1 :: any, { 2 :: any, { 3, { 4, 5 } :: any, 6 }, 7 }, 8 }
    local resultWithDepth = flatten(deepNestedArray, 2)

    expect(resultWithDepth).toEqual({ 1, 2, 3, { 4, 5 } :: any, 6, 7, 8 })
end)

it('returns the original array if depth is 0', function()
    local value = { { 1 }, { 2 } }
    local result = flatten(value, 0)
    expect(result).toBe(value)
end)

return nil
