local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local range = require('../range')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('returns the same array when empty', function()
    local empty = {}
    local result = range(empty, 1, 3)

    expect(result).toBe(empty)
end)

it('returns a range of the array', function()
    local result = range({ 'a', 'b', 'c', 'd' }, 2, 3)

    expect(result).toEqual({ 'b', 'c' })
end)

it('returns an empty array if the bounds are 0', function()
    local result = range({ 'a', 'b', 'c', 'd' }, 0, 0)

    expect(result).toEqual({})
end)

it('returns the first element if the range is (0, 1)', function()
    local result = range({ 'a', 'b', 'c', 'd' }, 0, 1)

    expect(result).toEqual({ 'a' })
end)

it('returns a reversed range of the array when the upper bound < lower bound', function()
    local result = range({ 'a', 'b', 'c', 'd' }, 3, 2)

    expect(result).toEqual({ 'c', 'b' })
end)

it('returns a range with one element when the upper bound is equal to the lower bound', function()
    local result = range({ 'a', 'b', 'c' }, 2, 2)

    expect(result).toEqual({ 'b' })
end)

it(
    'returns a range with one element when the upper bound is equal to the lower bound (negative)',
    function()
        local result = range({ 'a', 'b', 'c' }, -1, -1)

        expect(result).toEqual({ 'c' })
    end
)

it('returns a reversed array', function()
    local result = range({ 'a', 'b', 'c' }, -1, 1)

    expect(result).toEqual({ 'c', 'b', 'a' })
end)

return nil
