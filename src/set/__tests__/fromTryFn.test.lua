local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local fromTryFn = require('../fromTryFn')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('returns an empty set for a generator that immediately returns nil', function()
    local function generator()
        return nil
    end
    expect(fromTryFn(generator)).toEqual({})
end)

it('returns a set from values up until the generator returns nil', function()
    local letters = { 'a', 'b', 'c', 'd' }
    local function generator(i): string?
        return letters[i]
    end
    expect(fromTryFn(generator)).toEqual({ a = true, b = true, c = true, d = true })
end)

it('returns a set with deduplicated values', function()
    local function generator(i): string?
        if i < 5 then
            return 'a'
        end
        return nil
    end
    expect(fromTryFn(generator)).toEqual({ a = true })
end)

it('returns a set from values up until the generator errors', function()
    local function generator(i): string?
        if i < 5 then
            return tostring(i)
        end
        error('terminate')
    end
    expect(fromTryFn(generator)).toEqual({
        ['1'] = true,
        ['2'] = true,
        ['3'] = true,
        ['4'] = true,
    })
end)

return nil
