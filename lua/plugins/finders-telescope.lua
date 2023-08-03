
-- Highly extendable fuzzy finder over lists.
--
return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "master",
        dependencies = {
            "nvim-lua/plenary.nvim", -- utilities
	    "nvim-treesitter/nvim-treesitter",
        },
	keys = {
	    {
	        "<C-p>",
		"<cmd>Telescope git_files<cr>",
		desc = "Find: Git Files"
	    },
	    {
	        "<leader>ff",
		"<cmd>Telescope find_files<cr>",
		desc = "Find: All Files"
	    },
            {
	        "<leader>fg",
		"<cmd>Telescope live_grep<cr>",
		desc = "Find: Grep [Live]"
	    },
	    {
		"<leader>fG",
		function()
                    local builtin = require("telescope.builtin");
		    builtin.grep_string({ search = vim.fn.input("Grep > ") });
		end,
		desc = "Find: Grep [Expr]"
	    },
            {
	        "<leader>fb",
		"<cmd>Telescope buffers<cr>",
		desc = "Find: Buffers"
	    },
            {
	        "<leader>ft",
		"<cmd>Telescope help_tags<cr>",
		desc = "Find: Tags",
	    },
	},
    },
}
