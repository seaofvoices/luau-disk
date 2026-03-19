local function count(set: { [any]: any }): number
    local length = 0
    for _ in set do
        length += 1
    end
    return length
end

return count
