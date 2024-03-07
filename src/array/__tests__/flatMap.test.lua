local flatMap = require('../flatMap')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('creates a new list with the mapped values', function()
    local result = flatMap({ true, false }, tostring)

    expect(result).toEqual({ 'true', 'false' })
end)

it('creates a new list with the mapped values flatten', function()
    local result = flatMap({ true, false }, function(value)
        return { tostring(value) }
    end)

    expect(result).toEqual({ 'true', 'false' })
end)

it('creates a new list with the mapped values flatten', function()
    local result = flatMap({ 'abc', 'def' }, function(value)
        return string.split(value, '')
    end)

    expect(result).toEqual({ 'a', 'b', 'c', 'd', 'e', 'f' })
end)

it('removes the values that flatMap to nil', function()
    local result = flatMap({ true, false, true }, function(value)
        return if value == false then nil else 'ok'
    end)

    expect(result).toEqual({ 'ok', 'ok' })
end)

it('maps with the indexes', function()
    local result = flatMap({ 4, 5, 6 }, function(value, index)
        return index + value
    end)

    expect(result).toEqual({ 5, 7, 9 })
end)

return nil
