local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local fromFn = require('../fromFn')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('returns an empty set for a generator that immediately returns nil', function()
    local function generator()
        return nil
    end
    expect(fromFn(generator)).toEqual({})
end)

it('returns a set from values up until the generator returns nil', function()
    local function generator(i): string?
        if i < 5 then
            return string.char(96 + i)
        end
        return nil
    end
    expect(fromFn(generator)).toEqual({ a = true, b = true, c = true, d = true })
end)

it('returns a set from the generated values', function()
    local function generator(i): string?
        if i < 5 then
            return 'i=' .. i
        end
        return nil
    end
    expect(fromFn(generator)).toEqual({
        ['i=1'] = true,
        ['i=2'] = true,
        ['i=3'] = true,
        ['i=4'] = true,
    })
end)

it('returns a set with deduplicated values', function()
    local function generator(i): string?
        if i < 5 then
            return 'a'
        end
        return nil
    end
    expect(fromFn(generator)).toEqual({ a = true })
end)

return nil
