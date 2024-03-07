local None = require('../../None')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local merge = require('../merge')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('merges two maps', function()
    local result = merge({ prop = 1 }, { prop2 = 3 })

    expect(result).toEqual({ prop = 1, prop2 = 3 })
end)

it('merges two maps and remove entries using Disk.None', function()
    local result = merge({ prop = 1 }, { prop = None, prop2 = 3 })

    expect(result).toEqual({ prop2 = 3 })
end)

it('merges two objects without keeping metatables', function()
    local anyMetatable = { __index = function() end }
    local result =
        merge(setmetatable({ prop = 1 }, anyMetatable), setmetatable({ prop2 = 3 }, anyMetatable))

    expect(result).toEqual({ prop = 1, prop2 = 3 })
    expect(getmetatable(result)).toBe(nil)
end)

it('merges a table that has a call metatable', function()
    local callable = {
        __call = function(_self, ...)
            error(...)
        end,
    }

    local result = merge({ prop = 1 }, setmetatable({ prop2 = 3 }, callable))

    expect(result).toEqual({ prop = 1, prop2 = 3 })
end)

it('merges two maps and skip nil values', function()
    local result = merge({ prop = 1 }, nil, nil, { prop2 = 3 })

    expect(result).toEqual({ prop = 1, prop2 = 3 })
end)

it('merges two maps and override keys', function()
    local result = merge({ prop = 1 }, { prop = 3 })

    expect(result).toEqual({ prop = 3 })
end)

it('returns the same map if given one', function()
    local original = {}
    local result = merge(original)

    expect(result).toBe(original)
end)

it('returns the same map if given one and nil values', function()
    local original = {}
    local result = merge(original, nil, nil, nil)

    expect(result).toBe(original)
end)

it('returns the same map if given nil values and one', function()
    local original = {}
    local result = merge(nil, original, nil, nil)

    expect(result).toBe(original)
end)

it('throws an error if attempt to merge only nil values', function()
    expect(function()
        merge(nil, nil)
    end).toThrow('attempt to merge only nil values')
end)

return nil
