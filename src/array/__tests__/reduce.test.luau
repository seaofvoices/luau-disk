local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local reduce = require('../reduce')

local jest = jestGlobals.jest
local expect = jestGlobals.expect
local it = jestGlobals.it
local describe = jestGlobals.describe

describe('with an accumulator', function()
    it('calls the reducer for all elements', function()
        local reducer, reducerFn = jest.fn(function(acc: number, value)
            return acc + value
        end)
        local result = reduce({ 5, 8, 2, 4 }, reducerFn, 0)

        expect(result).toEqual(19)
        expect(reducer).toHaveBeenCalledTimes(4)
        expect(reducer.mock.calls).toEqual({
            { 0, 5, 1 },
            { 5, 8, 2 },
            { 13, 2, 3 },
            { 15, 4, 4 },
        })
    end)

    it('finds the minimum value', function()
        local result = reduce({ 5, 8, 2, 4 }, function(acc: number, value)
            return math.min(acc, value)
        end, math.huge)

        expect(result).toEqual(2)
    end)

    it('returns the initial value when the array is empty', function()
        local result = reduce({}, function(acc: number, value)
            return math.min(acc, value)
        end, 8)

        expect(result).toEqual(8)
    end)
end)

describe('without an accumulator', function()
    it('calls the reducer for all elements except the first', function()
        local reducer, reducerFn = jest.fn(function(acc: number, value)
            return acc + value
        end)
        local result = reduce({ 5, 8, 2, 4 }, reducerFn)

        expect(result).toEqual(19)
        expect(reducer).toHaveBeenCalledTimes(3)
        expect(reducer.mock.calls).toEqual({
            { 5, 8, 2 },
            { 13, 2, 3 },
            { 15, 4, 4 },
        })
    end)

    it('returns nil when the array is empty', function()
        local result = reduce({}, function(acc: number, value)
            return math.min(acc, value)
        end)

        expect(result).toBe(nil)
    end)
end)

return nil
