local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local count = require('../count')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('counts an empty set', function()
    expect(count({})).toEqual(0)
end)

it('counts the entries in a set', function()
    expect(count({ a = true, b = true })).toEqual(2)
end)

return nil
