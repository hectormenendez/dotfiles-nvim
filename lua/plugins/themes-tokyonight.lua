return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        transparent = true,
	terminal_colors = true,
	-- sets different background for special buffers
	sidebars = { "qf", "help", "terminal" },
	dim_inactive = true,
	-- make telescope borderless
        on_highlights = function(hl, c)
            local prompt = "#2d3149"
	    local indicator = "#262634"
	    hl.CursorLine = { bg = indicator };
	    hl.CursorColumn = { bg = indicator };
	    hl.ColorColumn = { bg = indicator };

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
