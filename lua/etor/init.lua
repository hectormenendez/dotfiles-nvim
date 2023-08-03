
vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    -- execute this when finish loading plugins.
    callback = function()
	-- TODO: I don't think this is necessary anymore
	vim.cmd("syntax on");

        print("Welcome et0r.");
    end,
});

require("etor.theme");
require("etor.settings");
require("etor.remaps");
