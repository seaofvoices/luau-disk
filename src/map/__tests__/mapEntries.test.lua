local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local mapEntries = require('../mapEntries')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('returns an empty map for an empty map', function()
    local result = mapEntries({}, function(key: string, value: number)
        return key, value
    end)
    expect(result).toEqual({})
end)

it('returns makes the keys of a map uppercase', function()
    local result = mapEntries({ a = true, b = false }, function(key, value)
        return string.upper(key), value
    end)
    expect(result).toEqual({ A = true, B = false })
end)

it('filters entries when the returned key is nil', function()
    local result = mapEntries({ a = true, b = false }, function(key, value)
        return if value == true then key else nil, value
    end)
    expect(result).toEqual({ a = true })
end)

it('filters entries when the returned value is nil', function()
    local result = mapEntries({ a = true, b = false }, function(key, value)
        return key, if value == true then false else nil
    end)
    expect(result).toEqual({ a = false })
end)

return nil
