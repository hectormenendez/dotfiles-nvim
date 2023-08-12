local utils = require("etor.utils");
local remaps_le = require("etor.remaps.leader-explore");

return {
    "folke/todo-comments.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
    },
    keys = utils.tablemerge(remaps_le.todos),
    opts = {
        -- show icons in the signs column
        signs = true,
        -- sign priority
        sign_priority = 8,

        -- keywords recognized as todo comments
        keywords = {
            BUG  = { icon = "", color = "error" },
            TODO = { icon = "", color = "info" },
            WARN = { icon = "", color = "warning", alt = { "HACK" } },
            NOTE = { icon = "", color = "hint", alt = { "INFO" } },
        },

        gui_style = {
            fg = "NONE", -- The gui style to use for the fg highlight group.
            bg = "BOLD", -- The gui style to use for the bg highlight group.
        },

        -- highlighting of the line containing the todo comment
        --    - before: highlights before the keyword (typically comment characters)
        --    - keyword: highlights of the keyword
        --    - after: highlights after the keyword (todo text)
        highlight = {
            multiline = true,
            -- extra lines that will be re-evaluated when changing a line
            multiline_context = 10,
            -- "fg" or "bg" or empty
            after = "fg",
            before = "",
            -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty.
            -- wide and wide_bg is the same as bg, but will also highlight
            -- surrounding characters, wide_fg acts accordingly but with fg)
            keyword = "wide",
            -- pattern or table of patterns, used for highlighting (vim regex)
            pattern = [[.*<(KEYWORDS)\s*:]],
            -- uses treesitter to match keywords in comments only
            comments_only = true,
            -- ignore lines longer than this
            max_line_len = 400,
            -- list of file types to exclude highlighting
            exclude = {},
        },

        colors = {
            error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
            warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
            info = { "DiagnosticInfo", "#2563EB" },
            hint = { "DiagnosticHint", "#10B981" },
            default = { "Identifier", "#7C3AED" },
            test = { "Identifier", "#FF00FF" }
        },

        search = {
            command = "rg",
            args = {
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
            },
            -- regex that will be used to match keywords. don't replace the (KEYWORDS) placeholder
            pattern = [[\b(KEYWORDS):]], -- ripgrep regex
        },
    }
}
