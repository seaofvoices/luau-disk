local average = require('../average')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('returns the average of all the values', function()
    local result = average({ 5, 8, 2, 5 })

    expect(result).toEqual(5)
end)

it('returns nil if the array is empty', function()
    local result = average({})

    expect(result).toEqual(nil)
end)

it('returns the only value', function()
    local result = average({ 4 })

    expect(result).toEqual(4)
end)

return nil
