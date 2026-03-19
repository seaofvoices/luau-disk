local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local chunks = require('../chunks')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('splits array into chunks of specified size', function()
    local array = { 1, 2, 3, 4, 5, 6, 7, 8 }
    local result = chunks(array, 3)

    expect(result).toEqual({
        { 1, 2, 3 },
        { 4, 5, 6 },
        { 7, 8 },
    })
end)

it('returns single chunk when size equals array length', function()
    local array = { 1, 2, 3 }
    local result = chunks(array, 3)

    expect(result).toEqual({ { 1, 2, 3 } })
end)

it('returns single chunk when size is greater than array length', function()
    local array = { 1, 2, 3 }
    local result = chunks(array, 5)

    expect(result).toEqual({ { 1, 2, 3 } })
end)

it('returns array of single-element chunks when size is 1', function()
    local array = { 1, 2, 3 }
    local result = chunks(array, 1)

    expect(result).toEqual({ { 1 }, { 2 }, { 3 } })
end)

it('rounds non-integer chunk sizes', function()
    local array = { 1, 2, 3, 4, 5 }
    local result = chunks(array, 2.7)

    expect(result).toEqual({
        { 1, 2, 3 },
        { 4, 5 },
    })
end)

it('throws error for non-positive chunk size', function()
    local array = { 1, 2, 3 }

    expect(function()
        chunks(array, 0)
    end).toThrow('chunk size must be greater than 0')

    expect(function()
        chunks(array, -1)
    end).toThrow('chunk size must be greater than 0')
end)

it('handles empty array', function()
    local array = {}
    local result = chunks(array, 3)

    expect(result).toEqual({})
end)

return nil
