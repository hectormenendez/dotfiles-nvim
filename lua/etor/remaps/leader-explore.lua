require("etor.utils").onload(function()
    local wk = require("which-key")
    wk.register({ ["<leader>e"] = { name = "+explore" } })
    wk.register({ ["<leader>et"] = { name = "explore: term" } })
    wk.register({ ["<leader>ep"] = { name = "explore: projects" } })

    -- adds lazy keybinding
    vim.api.nvim_set_keymap(
        "n",
        "<leader>el",
        ":Lazy<cr>",
        { noremap = true, silent = true, desc = "explore: lazy plugins" }
    );
end)

local M = {}

M.projects = {
    { "<leader>epp", "<cmd>Autosession search<cr>", desc = "explore: projects" },
    { "<leader>epd", "<cmd>Autosession delete<cr>", desc = "explore: projects: delete" },
}

M.alerts = {
    { "<leader>ea", "<cmd>TroubleToggle<cr>", desc = "explore: alerts" },
}

M.content = {
    {
        "<leader>e/",
        "<cmd>lua require('spectre').toggle()",
        desc = "explore: search & replace"
    },
}

M.files = {
    { "<leader>ef", "<cmd>NvimTreeToggle<cr>", desc = "explore: files" },
}

M.term = {

    {
        "<leader>etv",
        "<cmd>ToggleTerm dir=git_dir direction=vertical size=80<cr>",
        desc = "explore: term: vertical split",
    },
    {
        "<leader>ets",
        "<cmd>ToggleTerm dir=git_dir direction=horizontal size=20<cr>",
        desc = "explore: term: split",
    },
}

M.git = {
    {
        "<leader>eg",
        table.concat({
            "<cmd>",
            "TermExec",
            [[cmd="lazygit --git-dir=$(git rev-parse --git-dir) && exit 0"]],
            "direction=float",
            "go_back=0",
            "<cr>",
        }, " "),
        desc = "explore: git",
    }
}

M.undo = {
    { "<leader>eu", "<cmd>UndotreeToggle<cr>", desc = "explore: undo-tree" },
}

return M;
