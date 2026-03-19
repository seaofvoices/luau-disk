local binarySearchByKey = require('../binarySearchByKey')
local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('finds the index of an object by its key value', function()
    local array = {
        { id = 1, name = 'Alice' },
        { id = 2, name = 'Bob' },
        { id = 3, name = 'Charlie' },
        { id = 4, name = 'David' },
        { id = 5, name = 'Eve' },
    }
    local result = binarySearchByKey(array, 3, function(element)
        return element.id
    end)

    expect(result).toBe(3)
end)

it('returns nil when key value is not found', function()
    local array = {
        { id = 1, name = 'Alice' },
        { id = 2, name = 'Bob' },
        { id = 3, name = 'Charlie' },
    }
    local result = binarySearchByKey(array, 4, function(element)
        return element.id
    end)

    expect(result).toBe(nil)
end)

it('handles empty array', function()
    local array = {}
    local result = binarySearchByKey(array, 1, function(element)
        return element.id
    end)

    expect(result).toBe(nil)
end)

it('works with string keys', function()
    local array = {
        { id = 1, name = 'Alice' },
        { id = 2, name = 'Bob' },
        { id = 3, name = 'Charlie' },
        { id = 4, name = 'David' },
        { id = 5, name = 'Eve' },
    }
    local result = binarySearchByKey(array, 'Charlie', function(element)
        return element.name
    end)

    expect(result).toBe(3)
end)

return nil
