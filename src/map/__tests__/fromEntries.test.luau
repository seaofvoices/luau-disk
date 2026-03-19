local fromEntries = require('../fromEntries')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('converts an array of tuples to a map', function()
    local entries = {
        { 'a', '1' },
        { 'b', '2' },
        { 'c', '3' },
    }

    local result = fromEntries(entries)

    expect(result).toEqual({
        a = '1',
        b = '2',
        c = '3',
    })
end)

it('handles empty array', function()
    local entries = {}

    local result = fromEntries(entries)

    expect(result).toEqual({})
end)

it('handles duplicate keys by using the last value', function()
    local entries = {
        { 'a', '1' },
        { 'a', '2' },
        { 'b', '3' },
    }

    local result = fromEntries(entries)

    expect(result).toEqual({
        a = '2',
        b = '3',
    })
end)

it('uses custom key and value indices', function()
    local entries = {
        { [true] = 'a', [false] = '1' },
        { [true] = 'b', [false] = '2' },
        { [true] = 'c', [false] = '3' },
    }

    local result = fromEntries(entries, true, false)

    expect(result).toEqual({
        a = '1',
        b = '2',
        c = '3',
    })
end)

return nil
