------------------------------------------------------------ MINIMAL CONF

-- removes the original space keybinding
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true });

-- this has to be setup before lazy
vim.g.mapleader = " ";
vim.g.maplocalleader = " ";

-- disable the welcome message
vim.opt.shortmess = vim.opt.shortmess + { I = true }

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

require("lazy").setup({
    -- where to look for plugins?
    spec = {
        { import = "plugins" }
    },

    change_detection = {
        notify = false,
    },

    performance = {
        rtp = {
            disabled_plugins = {
                "netrwPlugin", -- using nvim-tree instead
                -- stolen these, hehe.
                "tohtml",
                "tutor",
                "gzip",
                "tarPlugin",
                "zipPlugin",
            }
        }
    },

    ui = {
        icons = {
            cmd = "⚡",
            config = "⚙️a",
            event = "📅",
            ft = "📂",
            init = "⚙",
            keys = "🗝",
            plugin = "🔌",
            runtime = "💻",
            source = "📄",
            start = "🚀",
            task = "🪪",
            lazy = "💤 ",
        }
    },
});

------------------------------------------------------------ MY SETTINGS

require("etor");
