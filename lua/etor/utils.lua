local M = {}

M.onload = function(callback)
    vim.api.nvim_create_autocmd("User", {
        pattern="VeryLazy",
        callback = callback
    })
end

-- Merges N lists together
M.tablemerge = function(...)
    local result = {}
    for _, t in ipairs({...}) do
        for _, v in ipairs(t) do
            table.insert(result, v)
        end
    end
    return result
end

-- pretty-print a table
function tableprint(t, indent, done)
    done = done or {}
    indent = indent or 0
    for k, v in pairs(t) do
        local prefix = string.rep(" ", indent)
        if type(v) == "table" and not done[v] then
            done[v] = true
            print(prefix .. tostring(k) .. ":")
            tableprint(v, indent + 1, done)
        else
            print(prefix .. tostring(k) .. ": " .. tostring(v))
        end
    end
end

M.tableprint = tableprint;

M.highlighter = function(highlights)
    for group, attributes in pairs(highlights) do
        local cmd = {"highlight", group}
        for attr, value in pairs(attributes) do
            table.insert(cmd, attr .. "=" .. value)
        end
        table.insert(cmd, "gui=nocombine")
        vim.cmd(table.concat(cmd, " "))
    end
end

return M;
