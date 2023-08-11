-- TODO: Make a theme switcher

local theme_set = function(t)
    vim.opt.termguicolors = true
    vim.cmd.colorscheme(t or "tokyonight");

    -- set window transparency
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" });
    -- vim.api.nvim_set_hl(0, "NormalFLoat", { bg = "none" });

    -- Show different color after line 90
    -- vim.o.colorcolumn = table.concat(vim.fn.range(91, 999), ',')
end;

theme_set("tokyonight-night");
--theme_set("tokyonight-storm");
--theme_set("tokyonight-day");
--theme_set("tokyonight-moon");

