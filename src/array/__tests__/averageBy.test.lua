local averageBy = require('../averageBy')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('returns the average of all the values', function()
    local result = averageBy({ '5', '8', '2', '5' }, tonumber :: any)

    expect(result).toEqual(5)
end)

it('returns nil if the array is empty', function()
    local result = averageBy({}, tonumber :: any)

    expect(result).toEqual(nil)
end)

it('returns the only value', function()
    local result = averageBy({ '4' }, tonumber :: any)

    expect(result).toEqual(4)
end)

return nil
