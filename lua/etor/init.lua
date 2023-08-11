local utils = require("etor.utils");
local theme_set = require("etor.theme").theme_set;

-- TODO: Make a theme switcher
theme_set("tokyonight-night");
--theme_set("tokyonight-storm");
--theme_set("tokyonight-day");
--theme_set("tokyonight-moon");

require("etor.settings");

utils.onload(function()
    -- hide command area, but allow toggling.
    vim.opt.cmdheight = 0
    vim.api.nvim_set_keymap(
        "n",
        "<leader>;",
        utils.fn_cmd(function()
            local v = vim.opt.cmdheight._value; -- TODO: seems hacky
            if v == 0 then
                vim.opt.cmdheight = 3
            else
                vim.opt.cmdheight = 0
            end
        end),
        { noremap = true, silent = true, desc = "$>" })

    -- temporary fix while I choose a session changer.
    -- r:are u:you ~:home? a.k.a. is this the root of your project, bitch?
    vim.api.nvim_set_keymap(
        "n",
        "<leader>.",
        ":lcd %:p:h<cr>",
        { noremap = true, silent = true, desc = "ru~?" }
    );

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
end)



