local utils = require("etor.utils");
local remaps_lf = require("etor.remaps.leader-find");
local remaps_g = require("etor.remaps.go");

-- Highly extendable fuzzy finder over lists.
--
return {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    lazy = true,
    dependencies = {
        "nvim-lua/plenary.nvim", -- utilities
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope-ui-select.nvim",
    },
    setup = function()
        -- Force using telescope on ever ui select
        -- NOTE: credit to: https://github.com/max397574/omega-nvim
        vim.ui.select = function(items, opts, on_choice)
            vim.cmd([[
                PackerLoad telescope.nvim
                PackerLoad telescope-ui-select.nvim
            ]])
            require("telescope").load_extension("ui_select")
            vim.ui.select(items, opts, on_choice)
        end
    end,
    keys = utils.table_merge(
        remaps_lf.files,
        remaps_lf.expressions,
        remaps_lf.others,
        remaps_g.lsp
    )
}
