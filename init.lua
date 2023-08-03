------------------------------------------------------------ MINIMAL CONF

vim.g.mapleader = " ";
vim.g.maplocalleader = " ";

local o = { noremap = true, silent = true };

-- removes the original space keybinding
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", o);

-- adds lazy keybinding
vim.api.nvim_set_keymap("n", "<leader>l", ":Lazy<cr>", o);

------------------------------------------------------------ PACKAGE MANAGER

local path_lazy = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(path_lazy) then
    vim.fn.system({
        "git",
	"clone",
	"--filter=blob:none",
	"--single-branch",
	"https://github.com/folke/lazy.nvim.git",
	path_lazy,
    })
end
vim.opt.rtp:prepend(path_lazy)

require("lazy").setup({{ import = "plugins" }});

------------------------------------------------------------ MY SETTINGS

require("etor");
