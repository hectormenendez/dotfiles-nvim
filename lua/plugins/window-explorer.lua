-- disable default explorer
vim.g.loaded_netrw = 1;
vim.g.loaded_netrwPlugin = 1;

return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false, -- recomended by the docs
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        width = 30,
        sort = {
            sorter = "case_sensitive",
        },
        view = {
            width = 30,
        },
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = false,
        },
    },
    keys = {
	{
            "<C-w>e",
    	    "<cmd>NvimTreeToggle<cr>",
    	    "Window: Exporer",
	},
    },
}
