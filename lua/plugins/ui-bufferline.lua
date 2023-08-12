local theme_colors = require("etor.theme").theme_colors;

return {
    "akinsho/bufferline.nvim",
    version = "*",
    opts = {
        options = {
            -- default: buffers; available: tabs, buffers
            mode = "buffers",
            -- whether highlightgroups can be overriden or not
            themable = false,
            -- slant, padded_slant, slope, padded_slope, thick, thin, { "|", "|" }
            separator_style = "slope",
            -- default: none;
            numbers = "none",
            indicator = {
                icon = " ",
                style = "icon"
            },
            buffer_close_icon = "×",
            modified_icon = "●",
            tab_size = 18,
            color_icons = false,
            show_buffer_close_icons = false,
        },
        -- TODO: This should be set in the theme, not here
        highlights = {
            fill = {
                fg = "None",
                bg = theme_colors.darkst,
            },
            separator = {
                fg = theme_colors.darkst,
                bg = theme_colors.darkst,
            },
            separator_selected = {
                fg = theme_colors.darkst,
                bg = "None",
            },
            separator_visible = {
                fg = theme_colors.darkst,
                bg = theme_colors.darkst,
            },
            background = {
                fg = theme_colors.darker,
                bg = theme_colors.darkst,
            },
            buffer_selected = {
                fg = theme_colors.litest,
                bg = 'None',
                bold = true,
                italic = false,
            },
            buffer_visible = {
                fg = theme_colors.darker,
                bg = theme_colors.darkst,
            },
            modified_visible = {
                bg = theme_colors.darkst,
            },
        };

    }
}



