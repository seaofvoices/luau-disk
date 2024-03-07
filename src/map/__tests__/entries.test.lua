local entries = require('../entries')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('returns all the entries by pairs', function()
    local result = entries({ property = true, other = false })

    expect(result).toEqual(
        expect.arrayContaining({ { 'property', true }, { 'other', false } } :: { { string | boolean } })
    )
end)

it('returns all the entries with keys', function()
    local result = entries({ property = true, other = false }, 'k', 'v')

    expect(result).toEqual(expect.arrayContaining({
        { k = 'property', v = true },
        { k = 'other', v = false },
    }))
end)

return nil
