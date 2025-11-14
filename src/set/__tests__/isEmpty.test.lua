local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local fromArray = require('../fromArray')
local isEmpty = require('../isEmpty')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('is true for an empty set', function()
    expect(isEmpty({})).toEqual(true)
end)

it('is false for a set with one entry', function()
    expect(isEmpty(fromArray({ true }))).toEqual(false)
end)

it('is false for a set with multiple entries', function()
    expect(isEmpty(fromArray({ 'property', 'other' }))).toEqual(false)
end)

return nil
