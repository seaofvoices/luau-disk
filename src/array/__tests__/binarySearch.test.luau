local binarySearch = require('../binarySearch')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('finds the index of a value in a sorted array', function()
    local array = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }
    local result = binarySearch(array, 7)

    expect(result).toBe(7)
end)

it('returns nil when value is not found', function()
    local array = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }
    local result = binarySearch(array, 11)

    expect(result).toBe(nil)
end)

it('handles empty array', function()
    local array = {}
    local result = binarySearch(array, 1)

    expect(result).toBe(nil)
end)

it('works with custom comparison function', function()
    local array = { 10, 9, 8, 7, 6, 5, 4, 3, 2, 1 }
    local result = binarySearch(array, 7, function(a: number, b: number)
        if a > b then
            return -1
        elseif a < b then
            return 1
        else
            return 0
        end
    end)

    expect(result).toBe(4)
end)

it('works with string values', function()
    local array = { 'apple', 'banana', 'cherry', 'date', 'elderberry' }
    local result = binarySearch(array, 'cherry')

    expect(result).toBe(3)
end)

return nil
