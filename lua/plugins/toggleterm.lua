return {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy",
    opts = {
    },
    keys = {
	{
	    "<ESC>",
	    "<C-\\><C-n>",
	    mode = "t",
	    desc = "ToggleTerm: Exit Terminal Mode.",
	},
        {
	    "<C-w>tt",
	    "<cmd>ToggleTermToggleAll<cr>",
	    desc = "ToggleTerm: ToggleAll",
        },
        {
	    "<C-w>t|",
	    "<cmd>ToggleTerm dir=git_dir direction=vertical size=80<cr>",
	    desc = "ToggleTerm: Vertical",
        },
        {
	    "<C-w>t-",
	    "<cmd>ToggleTerm dir=git_dir direction=horizontal<cr>",
	    desc = "ToggleTerm: Horizontal",
        },
        {
            "<C-w>tg",
            table.concat({
		"<cmd>",
		"TermExec",
		[[cmd="lazygit --git-dir=$(git rev-parse --git-dir) && exit 0"]],
		"direction=float",
		"go_back=0",
		"<cr>",
	    }, " "),
            desc = "ToggleTerm: Execute lazygit",
        },
    },
}
