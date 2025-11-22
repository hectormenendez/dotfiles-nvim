local indicator = "#000000"

return {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false, -- set this to false if this becomes your main theme
    priority = 1000, 
    config = function()
        require('github-theme').setup({
            options = {
                -- Compiled file's destination location
                hide_end_of_buffer = true, -- Hide the '~' character at the end of the buffer for a cleaner look
                hide_nc_statusline = true, -- Override the underline style for non-active statuslines
                transparent = false,       -- Disable setting bg (make neovim's background transparent)
                terminal_colors = true,    -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
                dim_inactive = false,      -- Non focused panes set to alternative background
                module_default = true,     -- Default enable value for modules
                styles = {                 -- Style to be applied to different syntax groups
                    comments = 'italic',       -- Value is any valid attr-list value `:help attr-list`
                    functions = 'NONE',
                    keywords = 'NONE',
                    variables = 'NONE',
                    conditionals = 'NONE',
                    constants = 'NONE',
                    numbers = 'NONE',
                    operators = 'NONE',
                    strings = 'NONE',
                    types = 'NONE',
                },
                inverse = {                -- Inverse highlight for different types
                    match_paren = false,
                    visual = false,
                    search = false,
                },
                darken = {                 -- Darken floating windows and sidebar-like windows
                    floats = true,
                    sidebars = {
                        enable = true,
                        list = {},             -- Apply dark background to specific windows
                    },
                },
            },
            palettes = {},
            specs = {},
            -- groups = {
            --     all = {
            --         CursorLine = { bg = indicator },
            --         -- CursorColumn = { bg = indicator },
            --         -- ColorColumn = { bg = indicator },
            --         -- BufferLineBackground = { bg = colors.bg.shade }, -- or use a specific color
            --     },
            -- }
        })

        -- vim.cmd('colorscheme github_dark')
    end,
}
