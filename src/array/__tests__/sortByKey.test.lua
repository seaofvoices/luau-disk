local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local sortByKey = require('../sortByKey')

local expect = jestGlobals.expect
local it = jestGlobals.it

local function newObject(name: string)
    return { name = name, value = math.random() }
end

it('sorts an array of objects using the key function', function()
    local a = newObject('a')
    local b = newObject('b')
    local k = newObject('k')
    local z = newObject('z')
    local result = sortByKey({ z, a, k, b }, function(object)
        return object.name
    end)

    expect(result).toEqual({ a, b, k, z })
end)

it('returns the same array if it is empty', function()
    local original = {}
    local result = sortByKey(original, function(object)
        return object.name
    end)

    expect(result).toBe(original)
end)

return nil
