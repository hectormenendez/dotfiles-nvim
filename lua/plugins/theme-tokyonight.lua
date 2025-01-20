return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        transparent = true,
        terminal_colors = true,
        dim_inactive = true,
        style = "storm",
        use_background = true,

        sidebars = { -- different background for some buffers
            "qf",
            "help",
            "terminal"
        },
        -- on_colors = (colors)
        --     colors.bg = "#ff0000"
        -- end,

        -- make telescope borderless
        on_highlights = function(hl, c)
            local prompt = "#2d3149"
            local indicator = "#191A26"
            hl.CursorLine = { bg = indicator };
            hl.CursorColumn = { bg = indicator };
            hl.ColorColumn = { bg = indicator };
            hl.BufferLineBackground = { bg = c.bg_dark };

            -- hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
            -- hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
            -- hl.TelescopePromptNormal = { bg = prompt }
            -- hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
            -- hl.TelescopePromptTitle = { bg = prompt, fg = prompt }
            -- hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
            -- hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
        end,
    },
}
