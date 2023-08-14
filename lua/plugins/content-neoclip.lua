local plugin_explore_telescope = require("plugins.explore-telescope")
local utils = require("etor.utils")

return {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
        "kkharji/sqlite.lua",
        plugin_explore_telescope[1],
    },
    keys = {
        { '"', "<cmd>Telescope neoclip default<cr>", desc = "registers" },
        { "'", "<cmd>Telescope macroscope<cr>", desc = "macros" },
    },
    init = function()
        local telescope = require("telescope")
        telescope.load_extension("neoclip")
        telescope.load_extension("macroscope")
    end,
    config = function()
        ---@diagnostic disable-next-line: param-type-mismatch
        vim.opt.clipboard:append { "unnamed", "unnamedplus" }

        local function filter(data)
            local is_whitespace = utils.table_filter(
                data.event.regcontents,
                function(str)
                    return vim.fn.match(str, [[^\s*$]]) ~= -1
                end
            )
            -- add more filters here
            return not is_whitespace
        end

        require("neoclip").setup({
            filter,
            -- default: 1000
            history = 999999,
            enable_macro_history = true,
            -- stored in `VimLeavePre` using `sqlite.lua`
            enable_persistent_history = true,
            -- store in persistance layer every time?
            -- this is helpful when running multiple sessions.
            -- TODO: how's performance? bad? use db_pull/db_push
            continuous_sync = true,
            -- default: true. useful for multi-liners
            preview = true,
            -- I don't understand the "*" register
            default_register = { "+", "-", '"' },
        })
    end,
}
