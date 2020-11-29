function debug_table(t)
    local str = ""
    for k, v in pairs(t) do
        str = str .. tostring(k) .. " " .. tostring(v) .. "\n"
    end
    naughty.notify({ text = str })
end

function ellipsis(str, size)
    if #str < size then
        return str
    end

    return str:sub(1, size-3) .. "..."
end

function eval(cmd)
    local fd = io.popen(cmd)
    local result = fd:read("*all")
    fd:close()
    return result
end