local name = "fuzzy-find: "

require("etor.utils").onload(function()
    require("which-key").register({ ["<leader>f"] = { name } })
end)

local M = {}

M.projects = {
    {
        "<leader>fp",
        "<cmd>Telescope session-lens<cr>",
        desc = name.."projects",
    }
}

M.files = {
    {
        "<leader>ff",
        "<cmd>Telescope find_files<cr>",
        desc = name.."files"
    },
    {
        "<leader>fg",
        "<cmd>Telescope git_files<cr>",
        desc= name.."git files"
    },
}

M.expressions = {
    {
        "<leader>f/",
        "<cmd>Telescope live_grep<cr>",
        desc = name.."regex: live"
    },
    {
        "<leader>f?",
        function()
            local builtin = require("telescope.builtin");
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end,
        desc = name.."regex: input"
    },
}

M.todos = {
    { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = name.."to-dos" },
}

M.others = {
    { "<leader>fg", "<cmd>Telescope help_tags<cr>", desc = name.."tags" },
    {
        "<leader>fb",
        "<cmd>Telescope buffers<cr>",
        desc = name.."buffers"
    },
}

return M;
