local name = "fuzzy-find: "

local key = "<leader>f";

require("etor.utils").onload(function()
    local wk = require("which-key")
    wk.register({ [key] = { name } })
end)

local M = {}

M.projects = {
    {
        key .. "p",
        "<cmd>Telescope session-lens<cr>",
        desc = name .. "projects",
    }
}

M.files = {
    { key .. "F", "<cmd>Telescope find_files<cr>", desc = name .. "files" },
    { key .. "f", "<cmd>Telescope git_files<cr>", desc = name .. "git files" },
}

M.expressions = {
    { key .. "/", "<cmd>Telescope live_grep<cr>", desc = name .. "regex: live" },
    {
        key .. "?",
        function()
            local builtin = require("telescope.builtin");
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end,
        desc = name .. "regex: input"
    },
}

M.todos = {
    { key .. "t", "<cmd>TodoTelescope<cr>", desc = name .. "to-dos" },
}

M.others = {
    { key .. "g", "<cmd>Telescope help_tags<cr>", desc = name .. "tags" },
    { key .. "h", "<cmd>Telescope highlights<cr>", desc = name .. "highlights" },
    { key .. "b", "<cmd>Telescope buffers<cr>", desc = name .. "buffers" },
}

return M;
