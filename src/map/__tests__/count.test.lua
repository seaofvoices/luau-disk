local count = require('../count')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('counts an empty map', function()
    expect(count({})).toEqual(0)
end)

it('counts the entries in a map', function()
    expect(count({ a = true, b = false })).toEqual(2)
end)

return nil
