local utils = require("etor.utils");
local theme_set = require("etor.theme").theme_set;

require("etor.settings");

if vim.g.neovide then
    require("etor.neovide");
end

theme_set("tokyonight");

utils.onload(function()
    -- hide command area.
    vim.opt.cmdheight = 0

    local o = { noremap = true, silent = true };

    -- Let's troll intruders
    vim.api.nvim_set_keymap('n', '<Left>', '<Nop>', o)
    vim.api.nvim_set_keymap('v', '<Left>', '<Nop>', o)
    vim.api.nvim_set_keymap('i', '<Left>', '<Nop>', o)
    vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', o)
    vim.api.nvim_set_keymap('v', '<Right>', '<Nop>', o)
    vim.api.nvim_set_keymap('i', '<Right>', '<Nop>', o)
    vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', o)
    vim.api.nvim_set_keymap('v', '<Up>', '<Nop>', o)
    vim.api.nvim_set_keymap('i', '<Up>', '<Nop>', o)
    vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', o)
    vim.api.nvim_set_keymap('v', '<Down>', '<Nop>', o)
    vim.api.nvim_set_keymap('i', '<Down>', '<Nop>', o)

    -- Avoid unintentional exMode
    vim.api.nvim_set_keymap('n', 'Q', '<Nop>', o)
    vim.api.nvim_set_keymap('c', ':q', '<Nop>', o)

    vim.api.nvim_set_keymap('n', '<Leader>bi', ':ls!<CR>', o)
    vim.api.nvim_set_keymap('n', '<Leader>bd', ':bufdo bd<CR>', o)

    -- mapping» normal» toggle»
    vim.api.nvim_set_keymap('n', '<Leader>ti', ':set list!<CR>', o)

    -- mapping» normal» search»
    vim.api.nvim_set_keymap('n', '/', '/\\v', o)
    vim.api.nvim_set_keymap('c', '%s', '%s/\\v', o)
    vim.api.nvim_set_keymap('n', '//', ':%s/\\v', o)
    vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohlsearch<CR><Esc>', o)
    vim.api.nvim_set_keymap('n', '<Esc><Esc><Esc>', ':/^❌ 💩 /<CR>', o)

    -- mapping» terminal»

    -- easier to switch between terminal and normal mode
    vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', o)
end)
