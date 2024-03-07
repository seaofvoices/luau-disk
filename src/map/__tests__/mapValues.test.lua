local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local mapValues = require('../mapValues')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('returns an empty map for an empty map', function()
    local result = mapValues({}, function(value: number)
        return value + 1
    end)
    expect(result).toEqual({})
end)

it('returns flips the boolean values of a map', function()
    local result = mapValues({ a = true, b = false }, function(value)
        return not value
    end)
    expect(result).toEqual({ a = false, b = true })
end)

it('filters entries when the returned value is nil', function()
    local result = mapValues({ a = true, b = false }, function(value)
        return if value == true then false else nil
    end)
    expect(result).toEqual({ a = false })
end)

return nil
