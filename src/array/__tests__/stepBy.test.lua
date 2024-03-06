local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local stepBy = require('../stepBy')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('returns the same array when step is 1', function()
    local original = { 1, 2, 3, 4, 5 }
    local result = stepBy(original, 1)

    expect(result).toBe(original)
end)

it('returns the same array when the length is 0', function()
    local original = {}
    local result = stepBy(original, 1)

    expect(result).toBe(original)
end)

it('returns the same array when the length is 1', function()
    local original = { 'a' }
    local result = stepBy(original, 1)

    expect(result).toBe(original)
end)

it('returns the reversed array when step is -1', function()
    local result = stepBy({ 1, 2, 3, 4, 5 }, -1)

    expect(result).toEqual({ 5, 4, 3, 2, 1 })
end)

it('returns every second element when step is 2', function()
    local result = stepBy({ 1, 2, 3, 4, 5 }, 2)

    expect(result).toEqual({ 1, 3, 5 })
end)

it('returns every third element when step is 3', function()
    local original = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }
    local result = stepBy(original, 3)

    expect(result).toEqual({ 1, 4, 7, 10 })
end)

it('returns the reversed array with step -2', function()
    local original = { 1, 2, 3, 4, 5, 6 }
    local result = stepBy(original, -2)

    expect(result).toEqual({ 6, 4, 2 })
end)

it('throws an error when an invalid step value is passed', function()
    expect(function()
        stepBy({ 1, 2, 3, 4, 5 }, 0)
    end).toThrow("invalid step value '0' passed to Array.stepBy")
end)

return nil
