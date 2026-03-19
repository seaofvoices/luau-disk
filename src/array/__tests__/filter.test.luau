local filter = require('../filter')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('filters a list using the predicate', function()
    local result = filter({ 1, 2, 3, 4 }, function(value)
        return value % 2 == 0
    end)

    expect(result).toEqual({ 2, 4 })
end)

it('filters a list using the predicate', function()
    local result = filter({ 'a', 'b', 'c' }, function(_value, index)
        return index % 2 == 1
    end)

    expect(result).toEqual({ 'a', 'c' })
end)

return nil
