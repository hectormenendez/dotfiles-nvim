require("etor.utils").onload(function()
    require("which-key").register({ ["<leader>e"] = { name= "+explore" } })
    require("which-key").register({ ["<leader>et"] = { name= "+term" } })
end)

local M = {}

M.files = {
    { "<leader>ef", "<cmd>NvimTreeToggle<cr>", desc="explore: files" },
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

return M;
