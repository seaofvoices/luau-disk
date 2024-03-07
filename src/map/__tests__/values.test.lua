local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local values = require('../values')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('returns an empty array for an empty map', function()
    expect(values({})).toEqual({})
end)

it('returns the values of a map', function()
    expect(values({ a = true, b = false })).toEqual({ true, false })
end)

return nil
