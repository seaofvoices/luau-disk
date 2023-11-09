local fromFn = require('../fromFn')
local jestGlobals = (require)('@pkg/jest-globals')

local expect = jestGlobals.expect
local it = jestGlobals.it

it('returns an empty array for a generator that immediately returns nil', function()
    local function generator()
        return nil
    end
    expect(fromFn(generator)).toEqual({})
end)

return nil
