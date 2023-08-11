return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
        options = {
            icons_enabled = false,
            theme = "iceberg_dark",
            always_divide_middle = true,
            globalstatus = false,

            section_separators = { left = '', right = '' },
            component_separators = { left = '', right = '' },

            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },

            ignore_focus = {},

            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            },
        },
        tabline = {},

        winbar = {},

        inactive_winbar = {},

        extensions = {},

        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff', 'diagnostics' },
            lualine_c = { 'filename' },
            lualine_x = { 'encoding', 'fileformat', 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
        },

        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' },
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {}
        },
    }
}
