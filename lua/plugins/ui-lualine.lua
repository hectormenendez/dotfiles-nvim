local theme_colors = require("etor.theme").theme_colors;

return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
        local theme = {
            normal = {
                a = { fg = theme_colors.darker, bg = theme_colors.darkst },
                b = { fg = theme_colors.liter,  bg = theme_colors.darker },
                c = { fg = theme_colors.darker, bg = theme_colors.darkst },
                z = { fg = theme_colors.liter,  bg = theme_colors.darker },
            },
            insert = {
                a = { fg = theme_colors.mode_i_fg, bg = theme_colors.mode_i_bg },
            },
            visual = {
                a = { fg = theme_colors.mode_v_fg, bg = theme_colors.mode_v_bg },
            },
            command = {
                a = { fg = theme_colors.mode_c_fg, bg = theme_colors.mode_c_bg },
            },
        }
        -- Put proper separators and gaps between components in sections
        local empty = require('lualine.component'):extend()
        local function process(sections)
            for name, section in pairs(sections) do
                local left = name:sub(9, 10) < 'x'
                for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
                    local o = { empty, color = { fg = "teal", bg = "crimson" } };
                    table.insert( section, pos * 2, o)
                end
                for id, comp in ipairs(section) do
                    if type(comp) ~= 'table' then
                        comp = { comp }
                        section[id] = comp
                    end
                    comp.separator = left and { right = '' } or { left = '' }
                end
            end
            return sections
        end

        require("lualine").setup({
            options = {
                icons_enabled = true,
                -- theme = "iceberg_dark",
                theme = theme,
                always_divide_middle = true,
                globalstatus = false,
                -- component_separators = { left = "┆", right = "┆" },
                component_separators = '',
                -- section_separators = { left = "░", right = "░" },
                section_separators = { left = '', right = '' },
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
            sections = process({
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { "filename" },
                lualine_x = {
                    "encoding",
                    {
                        "filetype",
                        colored = true,
                        icon_only = false,
                    },
                },
                lualine_y = { "progress" },
                lualine_z = { "location" }
            }),
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {}
            },
        })
    end,
}
