local WeakMap = require('../WeakMap')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('creates an weakmap', function()
    local result = WeakMap()

    expect(result).toEqual({})
end)

return nil
