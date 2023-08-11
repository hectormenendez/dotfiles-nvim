local M = {};

M.theme_colors = {
    fg_brightest = "#EEEFEF",
    darkest = "#10121A",
    darker = "#262A3D",
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
