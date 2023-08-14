local utils = require("etor.utils")
local remap_le = require("etor.remaps.leader-explore")

return {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy",
    keys = utils.table_merge(
        remap_le.term,
        remap_le.git,
        -- when in terminal mode, ESC will put you in normal mode
        { "<ESC>", "<C-\\><C-n>", mode = "t" }
    ),
    opts = {},
}
