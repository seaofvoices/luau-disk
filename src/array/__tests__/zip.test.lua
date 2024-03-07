local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local zip = require('../zip')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('creates a new array that zips 2 given arrays', function()
    local result = zip({ 2, 4 }, { 3, 5 })

    expect(result).toEqual({ { 2, 3 }, { 4, 5 } })
end)

it('creates a new array that zips values from 3 given arrays', function()
    local result = zip({ 2, 4 }, { 'a', 'b' }, { 3, 5 })

    expect(result).toEqual({ { 2 :: number | string, 'a', 3 }, { 4 :: number | string, 'b', 5 } })
end)

it('returns an empty array if one array is empty', function()
    local result = zip({ 2, 4 }, {})

    expect(result).toEqual({})
end)

it('wraps the element in a table if given only one array', function()
    local result = zip({ 1, 2, 3, 4 })

    expect(result).toEqual({ { 1 }, { 2 }, { 3 }, { 4 } })
end)

return nil
