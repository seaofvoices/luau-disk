local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local map = require('../map')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('creates a new list with the mapped values', function()
    local result = map({ true, false }, tostring)

    expect(result).toEqual({ 'true', 'false' })
end)

it('removes the values that map to nil', function()
    local result = map({ true, false, true }, function(value)
        return if value == false then nil else 'ok'
    end)

    expect(result).toEqual({ 'ok', 'ok' })
end)

it('maps with the indexes', function()
    local result = map({ 4, 5, 6 }, function(value, index)
        return index + value
    end)

    expect(result).toEqual({ 5, 7, 9 })
end)

return nil
