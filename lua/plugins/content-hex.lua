local xxd_dump_cmd = 'xxd -g 1 -u'
local xxd_cur_pos = nil

local function is_binary_file()
    local filename = vim.fn.expand('%:t')
    -- local basename = string.match(filename, "^[a-z]*$")
    local binary_ext = { 'png', 'jpg', 'jpeg', 'out' }
    local ext = string.match(filename, "%.([^%.]+)$")

    if ext == 'gik' then return false end

    if ext == nil and string.match(filename, '[a-z]+') then return true end
    if vim.tbl_contains(binary_ext, ext) then return true end

    return false
end

local function drop_undo_history()
    local undolevels = vim.o.undolevels
    vim.o.undolevels = -1
    vim.cmd [[exe "normal a \<BS>\<Esc>"]]
    vim.o.undolevels = undolevels
end

local function buf_read_pre()
    if not is_binary_file() then return end
    vim.bo.bin = true
end

local function buf_read_post()
    if not is_binary_file() then return end
    if vim.bo.bin then
        vim.cmd([[%! ]] .. xxd_dump_cmd)
        vim.bo.ft = 'xxd'
        drop_undo_history()
    end
end

local function buf_write_pre()
    if not is_binary_file() then return end
    if vim.bo.bin then
        xxd_cur_pos = vim.fn.getcurpos()
        vim.cmd [[%! xxd -r]]
    end
end

local function buf_write_post()
    if not is_binary_file() then return end
    if vim.bo.bin then
        vim.cmd([[%! ]] .. xxd_dump_cmd)
        vim.fn.setpos('.', xxd_cur_pos)
        vim.bo.mod = true
    end
end

local augroup_hex_editor = vim.api.nvim_create_augroup('hex_editor', { clear = true })

-- if yo're annoyed, just comment these out.
vim.api.nvim_create_autocmd({ 'BufReadPre' }, { group = augroup_hex_editor, callback = buf_read_pre })
vim.api.nvim_create_autocmd({ 'BufReadPost' }, { group = augroup_hex_editor, callback = buf_read_post })
vim.api.nvim_create_autocmd({ 'BufWritePre' }, { group = augroup_hex_editor, callback = buf_write_pre })
vim.api.nvim_create_autocmd({ 'BufWritePost' }, { group = augroup_hex_editor, callback = buf_write_post })

return {}
