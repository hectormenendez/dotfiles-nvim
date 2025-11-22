local keys_help = require("etor.remaps.F1-help")

-- Helper to know what keymaps are available
return {
    "folke/which-key.nvim",
    event = "VeryLazy",

    -- this is the time is going to take to open the plugin
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,

    keys = keys_help,
    -- insert configuration here
    opts = {
        -- Automatically setup triggers
        triggers = { "<auto>", mode = "nxsot" },

        -- shows a message in the commandline to know how to use the plugin
        show_help = true,

        -- show the currently pressed keys and its label in the command line
        show_keys = true,

        plugins = {
            -- shows a list of your markers on ' and ` (installed by default)
            marks = true,
            -- enables showing WhichKey when pressing z= (installed by default)
            -- to select spelling suggestions
            spelling = {
                enabled = true,
                suggestions = 5,
            },
            presets = {
                operators = true, -- d, y, ...
                motions = true,
                text_objects = true,
                windows = true,
                nav = true,
                z = true, -- folding
                g = true, -- TODO: find out what this does
            },
        },

        -- Disable icons all-together, we like our text, plain.
        icons = {
            rules = false,
            mappings = false,
        },

        delay = function(ctx)
            local marks = { "'", "`", "g'", "g`" }
            local registers = { '"', "<c-r>" }
            local spelling = { "z=" }
            -- join all the tables
            local no_delay = vim.tbl_extend("force", marks, registers, spelling)
            -- if the key is in the table, then no delay
            if vim.tbl_contains(no_delay, ctx.keys) then
                return 0
            end

            return ctx.plugin and 0 or 200
        end,

        filter = function(mapping)
            -- -- mappings without a description get filtered
            -- if mapping.desc and mapping.desc == "" then
            --     return false
            -- end
            -- excluide in insert mode the j and k keys
            local mode_i_or_v = mapping.mode == "i" or mapping.mode == "v"
            if mode_i_or_v and (mapping.keys == "j" or mapping.keys == "k") then
                return false
            end
            return true
        end,

        -- disable the plugin either by filetype or buffer type
        disable = {
            buftypes = {},
            filetypes = {},
        },
    },
}
