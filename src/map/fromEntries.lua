local function fromEntries<K, V>(
    entries: { { [any]: K | V } },
    keyIndex: any?,
    valueIndex: any?
): { [K]: V }
    local useKeyIndex = if keyIndex == nil then 1 else keyIndex
    local useValueIndex = if valueIndex == nil then useKeyIndex + 1 else valueIndex

    local result = {} :: { [K]: V }

    for _, entry in entries do
        local key = entry[useKeyIndex] :: K
        local value = entry[useValueIndex] :: V
        result[key] = value
    end

    return result
end

type FromEntriesFn =
    (<K, V>(entries: { { K | V } }) -> { [K]: V })
    & (<K, V, T>(entries: { { [T]: K | V } }, keyIndex: T, valueIndex: T) -> { [K]: V })

return fromEntries :: FromEntriesFn
