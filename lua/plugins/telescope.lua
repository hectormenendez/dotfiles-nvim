
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
		"Telescope: Find Files"
	    },
	    {
	        "<leader>ff",
		"<cmd>Telescope find_files<cr>",
		"Telescope: Find Files"
	    },
            {
	        "<leader>fg",
		"<cmd>Telescope live_grep<cr>",
		"Telescope: Live Grep"
	    },
	    {
		"<leader>fG",
		function()
                    local builtin = require("telescope.builtin");
		    builtin.grep_string({ search = vim.fn.input("Grep > ") });
		end,
		"Telescope: Grep"
	    },
            {
	        "<leader>fb",
		"<cmd>Telescope buffers<cr>",
		"Telescope: Find Buffers"
	    },
            {
	        "<leader>ft",
		"<cmd>Telescope help_tags<cr>",
		"Telescope: Help Tags",
	    },
	},
    },
    {
        "nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
    }
}
