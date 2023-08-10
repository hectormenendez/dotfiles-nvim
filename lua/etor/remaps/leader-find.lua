require("etor.utils").onload(function()
    require("which-key").register({ ["<leader>f"] = { name= "+find" } })
end)

local M = {}

M.files = {
    {
        "<leader>ff",
        "<cmd>Telescope find_files<cr>",
        desc = "find: files"
    },
    {
        "<leader>fg",
        "<cmd>Telescope git_files<cr>",
        desc="find: git files"
    },
}

M.expressions = {
    {
        "<leader>fx",
        "<cmd>Telescope live_grep<cr>",
        desc="find: eXpressions: live"
    },
    {
        "<leader>fX",
        function()
            local builtin = require("telescope.builtin");
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end,
        desc = "find: eXpressions: input"
    },
}

M.others = {
    {
        "<leader>fb",
        "<cmd>Telescope buffers<cr>",
        desc = "find: buffers"
    },
    {
        "<leader>ft",
        "<cmd>Telescope help_tags<cr>",
        desc = "find: tags",
    },
}

return M;
