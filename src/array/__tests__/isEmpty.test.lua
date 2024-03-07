local isEmpty = require('../isEmpty')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('is true for an empty array', function()
    expect(isEmpty({})).toEqual(true)
end)

it('is false for an array with one element', function()
    expect(isEmpty({ true })).toEqual(false)
end)

it('is false for an array with multiple elements', function()
    expect(isEmpty({ 5, true, '' })).toEqual(false)
end)

return nil
