local isEmpty = require('../isEmpty')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('is true for an empty object', function()
    expect(isEmpty({})).toEqual(true)
end)

it('is false for an object with one entry', function()
    expect(isEmpty({ property = true })).toEqual(false)
end)

it('is false for an object with multiple entries', function()
    expect(isEmpty({ property = true, other = false })).toEqual(false)
end)

return nil
