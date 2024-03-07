local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local remove = require('../remove')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('removes the keys from the map', function()
    local result = remove({ property = true, other = false }, 'other')

    expect(result).toEqual({ property = true })
end)

it('removes all keys from the map', function()
    local result = remove({ property = true, other = false }, 'other', 'property')

    expect(result).toEqual({})
end)

it('returns the same map if given no keys', function()
    local original = { property = true }
    local result = remove(original)

    expect(result).toBe(original)
end)

it('returns the same map if the given keys are not set', function()
    local original = { property = true }
    local result = remove(original, 'a', 'b')

    expect(result).toBe(original)
end)

it('returns the same map if the map is empty', function()
    local original = {}
    local result = remove(original, 'key', 'other')

    expect(result).toBe(original)
end)

it('returns the same map if given only nil keys', function()
    local original = { property = true }
    local result = remove(original, nil, nil, nil)

    expect(result).toBe(original)
end)

return nil
