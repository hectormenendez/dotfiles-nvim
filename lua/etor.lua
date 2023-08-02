local theme_set = function(t)
    vim.cmd.colorscheme(t or "tokyonight");
    -- set window transparency
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" });
    vim.api.nvim_set_hl(0, "NormalFLoat", { bg = "none" });
end;

return {
    onLoad = function()
        theme_set("tokyonight-night");
        --theme_set("tokyonight-storm")
	--theme_set("tokyonight-day")
	--theme_set("tokyonight-moon")
    end,
}

