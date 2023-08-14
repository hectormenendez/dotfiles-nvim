local theme_colors = require("etor.theme").theme_colors;
local utils = require("etor.utils")

utils.onload(function()
    -- uncomment these to show hidden characters
    -- TODO: create a toggler function
    -- vim.opt.list = true;
    -- vim.opt.listchars:append "eol:↴"
    -- vim.opt.listchars:append "space:."

    utils.highlighter({
        IndentBlanklineChar = { guifg = theme_colors.lite },
        -- IndentBlanklineSpaceChar = { guifg = "cyan", guibg = "magenta" },
        -- IndentBlanklineSpaceCharBlankline = { guifg = "cyan", guibg = "magenta" },
        IndentBlanklineContextChar = { guifg = "cyan", guibg = "magenta" },
        -- IndentBlanklineContextSpaceChar = { guifg = "cyan", guibg = "magenta" },
        -- IndentBlanklineContextStart = { guifg = "cyan", guibg = "magenta" },
        -- IndentBlanklineIndent1 = { guifg = "cyan", guibg = "magenta" },
        -- IndentBlanklineIndent2 = { guifg = "cyan", guibg = "magenta" },
        -- IndentBlanklineIndent4 - { guifg = "cyan", guibg = "magenta" },
        -- IndentBlanklineIndent5 - { guifg = "cyan", guibg = "magenta" },
        -- IndentBlanklineIndent6 - { guifg = "cyan", guibg = "magenta" },
        -- IndentBlanklineIndent3 - { guifg = "cyan", guibg = "magenta" },
    })
end)


return {
    "lukas-reineke/indent-blankline.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("indent_blankline").setup {
            -- setting these to true seems attractive, but they cause the lines to
            -- break when spacing is found
            use_treesitter = false,
            use_treesitter_scope = false,
            show_first_indent_level = false,
            strict_tabs = true,
            buftype_exclude = {
                "terminal",
                "nofile",
                "quickfix",
                "prompt"
            },

            -- as of Aug 11th 2023, this is not working for me
            -- I'm leaving it anyways in case of a future update fixes it
            show_current_context = true,
            show_current_context_start = false,
            show_current_context_start_on_current_line = true,
            context_highlight_list = { 'Error', 'Warning' },
            context_patterns = {
                "class", "return", "function", "method",
                "^if", "^while", "jsx_element", "^for",
                "^object", "^table", "block", "arguments",
                "if_statement", "else_clause", "jsx_element",
                "jsx_self_closing_element", "try_statement",
                "catch_clause", "import_statement", "operation_type"
            },
        }
    end
}
