local fromTryFn = require('../fromTryFn')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('returns an empty array for a generator that immediately returns nil', function()
    local function generator()
        return nil
    end
    expect(fromTryFn(generator)).toEqual({})
end)

it('returns an array from values up until the generator returns nil', function()
    local function generator(i): boolean?
        if i < 5 then
            return true
        end
        return nil
    end
    expect(fromTryFn(generator)).toEqual({ true, true, true, true })
end)

it('returns an array of indexes', function()
    local function generator(i): number?
        if i < 5 then
            return i
        end
        return nil
    end
    expect(fromTryFn(generator)).toEqual({ 1, 2, 3, 4 })
end)

it('returns an array from values up until the generator returns errors', function()
    local function generator(i): boolean?
        if i < 5 then
            return true
        end
        error('terminate')
    end
    expect(fromTryFn(generator)).toEqual({ true, true, true, true })
end)

return nil
