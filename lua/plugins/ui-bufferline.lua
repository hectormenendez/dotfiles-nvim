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
                bg = "None",
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
            duplicate = {
                fg = theme_colors.lite,
                bg = theme_colors.darkst,
                italic = false,
            },
            -- tab = {
            --     fg = "cyan",
            --     bg = "magenta",
            -- },
            -- tab_selected = {
            --     fg = "cyan",
            --     bg = "magenta",
            -- },
            -- tab_separator = {
            --     fg = "cyan",
            --     bg = "magenta",
            -- },
            -- tab_separator_selected = {
            --     fg = "cyan",
            --     bg = "magenta",
            --     sp = "yellow",
            --     underline = "red",
            -- },
            -- tab_close = {
            --     fg = "cyan",
            --     bg = "magenta",
            -- },
            -- close_button = {
            --     fg = "cyan",
            --     bg = "magenta",
            -- },
            -- close_button_visible = {
            --     fg = "cyan",
            --     bg = "magenta",
            -- },
            -- close_button_selected = {
            --     fg = "cyan",
            --     bg = "magenta",
            -- },
            -- numbers = {
            --     fg = "cyan",
            --     bg = "magenta",
            -- },
            -- numbers_visible = {
            --     fg = "cyan",
            --     bg = "magenta",
            -- },
            -- numbers_selected = {
            --     fg = "cyan",
            --     bg = "magenta",
            --     bold = true,
            --     italic = true,
            -- },
            -- diagnostic = {
            --     fg = "cyan",
            --     bg = "magenta",
            -- },
            -- diagnostic_visible = {
            --     fg = "cyan",
            --     bg = "magenta",
            -- },
            -- diagnostic_selected = {
            --     fg = "cyan",
            --     bg = "magenta",
            --     bold = true,
            --     italic = true,
            -- },
            -- hint = {
            --     fg = "cyan",
            --     sp = "yellow",
            --     bg = "magenta",
            -- },
            -- hint_visible = {
            --     fg = "cyan",
            --     bg = "magenta",
            -- },
            -- hint_selected = {
            --     fg = "cyan",
            --     bg = "magenta",
            --     sp = "yellow",
            --     bold = true,
            --     italic = true,
            -- },
            -- hint_diagnostic = {
            --     fg = "cyan",
            --     sp = "yellow",
            --     bg = "magenta",
            -- },
            -- hint_diagnostic_visible = {
            --     fg = "cyan",
            --     bg = "magenta",
            -- },
            -- hint_diagnostic_selected = {
            --     fg = "cyan",
            --     bg = "magenta",
            --     sp = "yellow",
            --     bold = true,
            --     italic = true,
            -- },
            -- info = {
            --     fg = "cyan",
            --     sp = "yellow",
            --     bg = "magenta",
            -- },
            -- info_visible = {
            --     fg = "cyan",
            --     bg = "magenta",
            -- },
            -- info_selected = {
            --     fg = "cyan",
            --     bg = "magenta",
            --     sp = "yellow",
            --     bold = true,
            --     italic = true,
            -- },
            -- info_diagnostic = {
            --     fg = "cyan",
            --     sp = "yellow",
            --     bg = "magenta",
            -- },
            -- info_diagnostic_visible = {
            --     fg = "cyan",
            --     bg = "magenta",
            -- },
            -- info_diagnostic_selected = {
            --     fg = "cyan",
            --     bg = "magenta",
            --     sp = "yellow",
            --     bold = true,
            --     italic = true,
            -- },
            -- warning = {
            --     fg = "cyan",
            --     sp = "yellow",
            --     bg = "magenta",
            -- },
            -- warning_visible = {
            --     fg = "cyan",
            --     bg = "magenta",
            -- },
            -- warning_selected = {
            --     fg = "cyan",
            --     bg = "magenta",
            --     sp = "yellow",
            --     bold = true,
            --     italic = true,
            -- },
            -- warning_diagnostic = {
            --     fg = "cyan",
            --     sp = "yellow",
            --     bg = "magenta",
            -- },
            -- warning_diagnostic_visible = {
            --     fg = "cyan",
            --     bg = "magenta",
            -- },
            -- warning_diagnostic_selected = {
            --     fg = "cyan",
            --     bg = "magenta",
            --     sp = "yellow",
            --     bold = true,
            --     italic = true,
            -- },
            -- error = {
            --     fg = "cyan",
            --     bg = "magenta",
            --     sp = "yellow",
            -- },
            -- error_visible = {
            --     fg = "cyan",
            --     bg = "magenta",
            -- },
            -- error_selected = {
            --     fg = "cyan",
            --     bg = "magenta",
            --     sp = "yellow",
            --     bold = true,
            --     italic = true,
            -- },
            -- error_diagnostic = {
            --     fg = "cyan",
            --     bg = "magenta",
            --     sp = "yellow",
            -- },
            -- error_diagnostic_visible = {
            --     fg = "cyan",
            --     bg = "magenta",
            -- },
            -- error_diagnostic_selected = {
            --     fg = "cyan",
            --     bg = "magenta",
            --     sp = "yellow",
            --     bold = true,
            --     italic = true,
            -- },
            -- modified = {
            --     fg = "cyan",
            --     bg = "magenta",
            -- },
            -- modified_selected = {
            --     fg = "cyan",
            --     bg = "magenta",
            -- },
            -- duplicate_selected = {
            --     fg = "cyan",
            --     bg = "magenta",
            --     italic = true,
            -- },
            -- duplicate_visible = {
            --     fg = "cyan",
            --     bg = "magenta",
            --     italic = true,
            -- },
            -- indicator_visible = {
            --     fg = "cyan",
            --     bg = "magenta",
            -- },
            -- indicator_selected = {
            --     fg = "cyan",
            --     bg = "magenta",
            -- },
            -- pick_selected = {
            --     fg = "cyan",
            --     bg = "magenta",
            --     bold = true,
            --     italic = true,
            -- },
            -- pick_visible = {
            --     fg = "cyan",
            --     bg = "magenta",
            --     bold = true,
            --     italic = true,
            -- },
            -- pick = {
            --     fg = "cyan",
            --     bg = "magenta",
            --     bold = true,
            --     italic = true,
            -- },
            -- offset_separator = {
            --     fg = "cyan",
            --     bg = "magenta",
            -- },
            -- trunc_marker = {
            --     fg = "cyan",
            --     bg = "magenta",
            -- }
        },
    }
}
