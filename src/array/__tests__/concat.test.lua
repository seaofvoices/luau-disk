local concat = require('../concat')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('concats 2 arrays', function()
    local result = concat({ 'a', 'b' }, { 'c', 'd' })

    expect(result).toEqual({ 'a', 'b', 'c', 'd' })
end)

it('concats 3 arrays', function()
    local result = concat({ 'a', 'b' } :: { string | number }, { 'c', 'd' }, { 5, 6 } :: any)

    expect(result).toEqual({ 'a' :: string | number, 'b', 'c', 'd', 5, 6 })
end)

it('concats arrays and skip nil values', function()
    local result = concat({ 'a', 'b' } :: { string | number }, nil, { 5, 6 })

    expect(result).toEqual({ 'a' :: string | number, 'b', 5, 6 })
end)

it('returns the same array if given only one', function()
    local original = { 1, 2, 3, 4 }
    local result = concat(original)

    expect(result).toBe(original)
end)

it('returns the same array if given only empty arrays or nil', function()
    local original = { 1, 2, 3, 4 }
    local result = concat(original, {}, nil, {}, {})

    expect(result).toBe(original)
end)

return nil
