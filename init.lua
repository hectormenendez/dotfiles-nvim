-- Initialize my personal configs
require("etor");

-- Install package-manager if not available already
--
local path_lazy = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(path_lazy) then
    vim.fn.system({
        "git",
	"clone",
	"--filter=blob:none",
	"https://github.com/folke/lazy.nvim.git",
	"--branch=main",
	path_lazy,
    })
end
vim.opt.rtp:prepend(path_lazy)

-- Configure package manager
-- Manage plugins using the `:Lazy` command
-- create a new file in the `./plugins` folder to load your plugin config.
--
require("lazy").setup("plugins")
