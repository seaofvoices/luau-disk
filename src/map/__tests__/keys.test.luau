local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local keys = require('../keys')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('returns an empty array for an empty map', function()
    expect(keys({})).toEqual({})
end)

it('returns the keys of a map', function()
    local result = keys({ a = true, b = false })
    expect(result).toEqual(expect.arrayContaining({ 'a', 'b' }))
    expect(#result).toEqual(2)
end)

return nil
