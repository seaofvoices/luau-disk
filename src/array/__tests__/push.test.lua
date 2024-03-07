local jestGlobals = require('@pkg/@jsdotlua/jest-globals')
local push = require('../push')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('pushes one value to the array', function()
    local result = push({ 'start' }, 'end')

    expect(result).toEqual({ 'start', 'end' })
end)

it('does not mutate the original array', function()
    local original = { 'start' }
    local _ = push(original, 'end')

    expect(original).toEqual({ 'start' })
end)

it('pushes two values to the array', function()
    local result = push({ 'start' }, 'middle', 'end')

    expect(result).toEqual({ 'start', 'middle', 'end' })
end)

it('does not push nil values', function()
    local result = push({ 'start' }, nil, 'end')

    expect(result).toEqual({ 'start', 'end' })
end)

return nil
