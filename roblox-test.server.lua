local ReplicatedStorage = game:GetService('ReplicatedStorage')

local jest = require('@pkg/@jsdotlua/jest')

local success, result = jest.runCLI(ReplicatedStorage, {
    color = false,
    colors = false,
}, { ReplicatedStorage.disk }):await()

if not success then
    warn(tostring(result))
    return
end

-- success seems to be flipped
if result.results.success then
    warn('test failure')
end

task.wait(0.5)
