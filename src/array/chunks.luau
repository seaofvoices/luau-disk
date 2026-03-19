local function chunks<T>(array: { T }, size: number): { { T } }
    size = math.round(size)
    local length = #array

    if size <= 0 then
        error('chunk size must be greater than 0')
    elseif length == 0 then
        return {}
    elseif size == 1 then
        local result = table.create(length)
        for _, value in array do
            table.insert(result, { value })
        end
        return result
    elseif size >= length then
        return { array }
    end

    local result = table.create(math.ceil(length / size))
    local currentChunk = table.create(size)
    local currentSize = 0

    for _, value in array do
        table.insert(currentChunk, value)
        currentSize += 1

        if currentSize == size then
            table.insert(result, currentChunk)
            currentChunk = table.create(size)
            currentSize = 0
        end
    end

    if currentSize ~= 0 then
        table.insert(result, currentChunk)
    end

    return result
end

return chunks
