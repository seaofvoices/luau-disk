local contains = require('../contains')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('is false for an empty array', function()
    local result = contains({}, 2)

    expect(result).toEqual(false)
end)

it('is true if the array contains the element', function()
    local result = contains({ 1, 6, 5, 4 }, 6)

    expect(result).toEqual(true)
end)

it('is false if the array does not contain the element', function()
    local result = contains({ 1, 6, 5, 4 }, 2)

    expect(result).toEqual(false)
end)

return nil
