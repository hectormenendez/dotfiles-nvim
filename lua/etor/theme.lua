local M = {};

M.theme_icons = {
    diagnostics = {
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»'
    },
}

M.theme_colors = {
    litest = "#EEEFEF",
    liter = "slategray",
    lite = "#242839",
    darkst = "#10121A",
    darker = "#262A3D",
    mode_c_fg = "orange",
    mode_c_bg = "crimson",
    mode_v_fg = "midnightblue",
    mode_v_bg = "deepskyblue",
    mode_i_fg = "pink",
    mode_i_bg = "deeppink",
}

M.theme_set = function(t)
    vim.opt.termguicolors = true
    vim.cmd.colorscheme(t or "tokyonight");

    -- set window transparency
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" });
    -- vim.api.nvim_set_hl(0, "NormalFLoat", { bg = "none" });

    -- Show different color after line 90
    -- vim.o.colorcolumn = table.concat(vim.fn.range(91, 999), ',')
end;

return M;
