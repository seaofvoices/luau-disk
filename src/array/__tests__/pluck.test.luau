local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local pluck = require('../pluck')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('plucks a single key from each element', function()
    local result = pluck({ { id = 1, name = 'a' }, { id = 2, name = 'b' } }, 'name')

    expect(result).toEqual({ 'a', 'b' })
end)

it('returns an empty array when the input array is empty', function()
    local result = pluck({}, 'x')

    expect(result).toEqual({})
end)

it('plucks a nested path when given an array of keys', function()
    local result = pluck({
        { outer = { inner = 1 } },
        { outer = { inner = 2 } },
    }, { 'outer', 'inner' })

    expect(result).toEqual({ 1, 2 })
end)

it('returns the same array when the keys list is empty', function()
    local array = { { a = 1 }, { a = 2 } }
    local result = pluck(array, {})

    expect(result).toBe(array)
end)

it('omits elements whose plucked value is nil', function()
    local result = pluck({
        { x = 1 :: number?, y = nil :: number? },
        { y = 2 },
        { x = 3 },
    }, 'x')

    expect(result).toEqual({ 1, 3 })
end)

it('omits elements when a nested key is missing', function()
    local result = pluck({
        { outer = { inner = 1 } },
        { outer = {} :: any },
        { outer = { inner = 3 } },
    }, { 'outer', 'inner' })

    expect(result).toEqual({ 1, 3 })
end)

it('omits elements that are not indexable for the given key', function()
    local result = pluck({ { n = 1 } :: any, 2, { n = 2 } }, 'n')

    expect(result).toEqual({ 1, 2 })
end)

it('supports numeric keys on table elements', function()
    local result = pluck({ { [1] = 'a' }, { [1] = 'b' } }, 1)

    expect(result).toEqual({ 'a', 'b' })
end)

return nil
