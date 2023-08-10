require("etor.theme");
require("etor.settings");

require("etor.utils").onload(function()
    -- vim.cmd("syntax on"); 

    -- temporary fix while I choose a session changer.
    -- r:are u:you ~:home? a.k.a. is this the root of your project, bitch?
    vim.api.nvim_set_keymap(
        "n",
        "<leader>.",
        ":lcd %:p:h<cr>",
        { noremap = true, silent = true, desc = "ru~?" }
    );

    local o = { noremap = true, silent = true };

    -- Avoid unintentional exMode
    vim.api.nvim_set_keymap('n', 'Q', '<Nop>', o)
    vim.api.nvim_set_keymap('n', 'q', '<Nop>', o)
    vim.api.nvim_set_keymap('c', 'q', '<Nop>', o)
    vim.api.nvim_set_keymap('c', 'Q', '<Nop>', o)

end)
