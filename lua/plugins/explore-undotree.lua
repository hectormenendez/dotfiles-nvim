local utils = require("etor.utils")
local maps_le = require("etor.remaps.leader-explore")

return {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
        require('undotree').setup({
            float_diff = false, -- using float window previews diff, set this `true` will disable layout option
            layout = "left_bottom", -- "left_bottom", "left_left_bottom"
            position = "right", -- "left", "bottom"
            ignore_filetype = { 'undotree', 'undotreeDiff', 'qf', 'TelescopePrompt', 'spectre_panel', 'tsplayground' },
            window = {
                winblend = 0,
            },
        })
    end,
    keys = utils.table_merge(maps_le.undo)
}
