local isArray = require('../isArray')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local expect = jestGlobals.expect
local it = jestGlobals.it

local trueCases: { [string]: { any } } = {
    ['an empty array'] = {},
    ['an array'] = { 1, 2, 3 },
}

local falseCases: { [string]: any } = {
    ['an empty string'] = '',
    ['a number'] = 0,
    ['a sparse array'] = { true :: any, false, nil, 8, '' },
    ['an object'] = { property = '' },
}

for case, value in trueCases do
    it(string.format('is true for %s', case), function()
        expect(isArray(value)).toEqual(true)
    end)
end

for case, value in falseCases do
    it(string.format('is false for %s', case), function()
        expect(isArray(value)).toEqual(false)
    end)
end

it('is false for nil', function()
    expect(isArray(nil)).toEqual(false)
end)

return nil
