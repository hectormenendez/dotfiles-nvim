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
        triggers = "auto", -- { "<leader>" },

        -- enable this to hide mappings for which you didn't specify a label
        ignore_missing = false,

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

        -- Used to override the default display of certain keys
        key_labels = {
            -- ["<space>"] = "SPC",
        },

        -- Overrides to the icons shown in the UI
        icons = {
            -- used in the command line area, shows your active key combo
            breadcrumb = "»",
            -- used between a key and it's label
            separator = "",
            -- symbol prepended to a group
            group = "+",
        },

        -- hides mappings
        hidden = {
            -- "<silent>",
        },
        -- on the following, the plugin will showup immediately
        triggers_nowait = {
            -- marks
            "`", "'", "g`", "g'",
            -- registers
            '"', "<c-r>",
            -- spelling
            "z=",
        },
        -- ignore keys in certain modes
        triggers_blacklist = {
            i = { "j", "k" },
            v = { "j", "k" },
        },
        -- disable the plugin either by filetype or buffer type
        disable = {
            buftypes = {},
            filetypes = {},
        },
    },
}

