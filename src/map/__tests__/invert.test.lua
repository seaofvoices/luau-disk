local invert = require('../invert')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('inverts a non-empty map', function()
    local originalMap = { apple = 'red', banana = 'yellow', carrot = 'orange' }
    local invertedMap = invert(originalMap)

    expect(invertedMap).toEqual({ red = 'apple', yellow = 'banana', orange = 'carrot' })
end)

it('returns the same map when empty', function()
    local originalMap = {}
    local invertedMap = invert(originalMap)

    expect(invertedMap).toBe(originalMap)
end)

it('inverts a map with duplicate values', function()
    local originalMap =
        { apple = 'fruit', banana = 'fruit', carrot = 'vegetable', broccoli = 'vegetable' }
    local invertedMap = invert(originalMap)

    expect(invertedMap).toEqual({ fruit = expect.any('string'), vegetable = expect.any('string') })
end)

it('inverts a map with different value types', function()
    local originalMap = { name = 'John', age = 30, isStudent = false }
    local invertedMap = invert(originalMap)

    expect(invertedMap).toEqual({
        John = 'name',
        [30] = 'age',
        [false] = 'isStudent',
    } :: { [string | number | boolean]: string })
end)

return nil
