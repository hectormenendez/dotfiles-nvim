local theme_colors = require("etor.theme").theme_colors;

return {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    config = function()
        require("hlchunk").setup({
            chunk = {
                enable = true,
                notify = true,
                use_treesitter = true,
                chars = {
                    horizontal_line = "─",
                    vertical_line = "│",
                    left_top = "╭",
                    left_bottom = "╰",
                    right_arrow = "─",
                },
                style = {
                    { fg = theme_colors.liter },
                    { fg = "#DB4B4B" }, -- used to makr chunks with errors
                },
                textobject = "",
                max_file_size = 1024 * 1024,
                error_sign = true,
            },
            indent = {
                enable = true,
                use_treesitter = true,
                chars = {
                    "▏",
                }
            },
            line_num = {
                enable = false,
                use_treesitter = true,
                style = theme_colors.liter,
            },
            blank = {
                enable = false,
                chars = { "․" },
            },
        })
    end
}
