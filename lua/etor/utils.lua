local M = {}

function M.onload(callback)
    vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = callback
    })
end

function M.string_trim(s)
    return s:match '^()%s*$' and '' or s:match '^%s*(.*%S)'
end

-- Filters a table using given filter fn
function M.table_filter(table, fn)
    for _, yanked in ipairs(table) do
        if not fn(yanked) then
            return false;
        end
    end
    return true
end

-- Merges N lists together
function M.table_merge(...)
    local result = {}
    for _, t in ipairs({ ... }) do
        for _, v in ipairs(t) do
            table.insert(result, v)
        end
    end
    return result
end

-- pretty-print a table
function M.table_print(t, indent, done)
    done = done or {}
    indent = indent or 0
    for k, v in pairs(t) do
        local prefix = string.rep(" ", indent)
        if type(v) == "table" and not done[v] then
            done[v] = true
            print(prefix .. tostring(k) .. ":")
            M.table_print(v, indent + 1, done)
        else
            print(prefix .. tostring(k) .. ": " .. tostring(v))
        end
    end
end

-- set highlights from a table
function M.highlighter(highlights)
    for group, attributes in pairs(highlights) do
        local cmd = { "highlight", group }
        for attr, value in pairs(attributes) do
            table.insert(cmd, attr .. "=" .. value)
        end
        table.insert(cmd, "gui=nocombine")
        vim.cmd(table.concat(cmd, " "))
    end
end

-- find a buffer by name
function M.buffer_find(name)
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        buf_name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")
        if (name == buf_name) then
            return buf
        end
    end
    return -1
end

function M.string_time()
    return string.format("%s:%03d", os.date("%H:%M:%S"), vim.loop.now() % 1000)
    -- return vim.loop.now()
    -- return os.date("%H%M%S")
end

-- print to a buffer
function M.buffer_print(...)
    local args = { ... }
    local buf_name = '|< !print'
    local buf_id = M.buffer_find(buf_name)

    if buf_id == -1 then
        buf_id = vim.api.nvim_create_buf(true, true)
        vim.api.nvim_buf_set_name(buf_id, buf_name)
    end

    for _, arg in ipairs(args) do
        local time = M.string_time()
        local lines = {}
        for line in tostring(arg):gmatch("[^\r\n]+") do
            table.insert(lines, time .. " | " .. line)
        end
        -- add each line to end of buffer
        for _, line in ipairs(lines) do
            vim.api.nvim_buf_set_lines(buf_id, -1, -1, false, { line })
        end
    end
end

local fn_cache = {}
local function fn_register(fn)
    table.insert(fn_cache, fn)
    return #fn_cache
end

function M.fn_apply(id)
    fn_cache[id]()
end

function M.fn_cmd(fn)
    return string.format(
        "<cmd>lua require('%s').fn_apply(%s)<CR>",
        "etor.utils",
        fn_register(fn)
    )
end

return M;
