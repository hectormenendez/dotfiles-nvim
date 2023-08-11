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
                bg = "#10121A",
            },
            separator = {
                fg = '#10121A',
                bg = '#10121A',
            },
            separator_selected = {
                fg = "#10121A",
                bg = "None",
            },
            separator_visible = {
                fg = '#10121A',
                bg = '#10121A',
            },
            background = {
                fg = '#262A3D',
                bg = '#10121A',
            },
            buffer_selected = {
                fg = '#EEEFEF',
                bg = 'None',
                bold = true,
                italic = false,
            },
            buffer_visible = {
                fg = '#262A3D',
                bg = '#10121A',
            },
        };

    }
}



