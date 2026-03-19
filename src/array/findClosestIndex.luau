local function findClosest(array: { number }, target: number, start: number?): number?
    local length = #array
    if length == 0 then
        return nil
    elseif length == 1 then
        return 1
    end

    local closestIndex = nil
    local closest = nil

    if start == nil or start == 1 then
        for index, element in array do
            local distance = math.abs(element - target)
            if closest == nil or distance < closest then
                closest = distance
                closestIndex = index
            end
        end
    else
        for i = start, length do
            local element = array[i]
            local distance = math.abs(element - target)
            if closest == nil or distance < closest then
                closest = distance
                closestIndex = i
            end
        end
    end

    return closestIndex
end

return findClosest
