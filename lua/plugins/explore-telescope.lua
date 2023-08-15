local utils = require("etor.utils");
local remaps_lf = require("etor.remaps.leader-find");

-- Highly extendable fuzzy finder over lists.
--
return {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim", -- utilities
        "nvim-treesitter/nvim-treesitter",
    },
    keys = utils.table_merge(
        remaps_lf.files,
        remaps_lf.expressions,
        remaps_lf.others
    )
}
