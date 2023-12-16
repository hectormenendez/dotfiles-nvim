local M = {}

M.key = "<leader>e"
M.name = "explore: ";

M.key_diag = M.key .. "d"
M.name_diag = M.name .. "diagnostics"

M.key_cont = M.key .. "/"
M.name_cont = M.name .. "search & replace"

M.key_git = M.key .. "g"
M.name_git = M.name .. "git"

M.key_undo = M.key .. "u"
M.name_undo = M.name .. "undo-tree"

M.key_file = M.key .. "f"
M.name_file = M.name .. "files"

M.key_proj = M.key .. "p"
M.name_proj = M.name .. "projects: "

M.key_proj_save = M.key_proj .. "s"
M.name_proj_save = M.name_proj .. "save"

M.key_proj_sel = M.key_proj .. "p"
M.name_proj_sel = M.name_proj .. "select"

M.key_proj_del = M.key_proj .. "d"
M.name_proj_del = M.name_proj .. "delete"

M.key_term = M.key .. "t"
M.name_term = M.name .. "term: "

M.key_term_f = M.key_term .. "t"
M.name_term_f = M.name_term .. "float"

M.key_term_v = M.key_term .. "v"
M.name_term_v = M.name_term .. "split: vertical"

M.key_term_h = M.key_term .. "s"
M.name_term_h = M.name_term .. "split: horizontal"

M.key_mang = M.key .. "m"
M.name_mang = M.name .. "managers: "

M.key_mang_lazy = M.key_mang .. "p"
M.name_mang_lazy = M.name_mang .. "plugins"

M.key_mang_lsp = M.key_mang .. "l"
M.name_mang_lsp = M.name_mang .. "language servers: "

M.key_mang_lsp_a = M.key_mang_lsp .. "a"
M.name_mang_lsp_a = M.name_mang_lsp .. "install"

M.key_mang_lsp_d = M.key_mang_lsp .. "d"
M.name_mang_lsp_d = M.name_mang_lsp .. "uninstall"

require("etor.utils").onload(function()
    local wk = require("which-key")
    wk.register({ [M.key] = { name = M.name } })
    wk.register({ [M.key_term] = { name = M.name_term } })
    wk.register({ [M.key_proj] = { name = M.name_proj } })
    wk.register({ [M.key_mang] = { name = M.name_mang } })
    wk.register({ [M.key_mang_lsp] = { name = M.name_mang_lsp } })

    -- adds lazy keybinding
    vim.keymap.set("n", M.key_mang_lazy, "<cmd>Lazy<cr>", { desc = M.name_mang_lazy })
end)


M.diag = {
    { M.key_diag, "<cmd>TroubleToggle<cr>", desc = M.name_diag }
}

M.cont = {
    { M.key_cont, "<cmd>lua require('spectre').toggle()", desc = M.name_cont },
}

local cmd_git = table.concat({
    "<cmd>",
    "TermExec",
    [[cmd="lazygit --git-dir=$(git rev-parse --git-dir) && exit 0"]],
    "direction=float",
    "go_back=0",
    "<cr>",
}, " ")
M.git = {
    { M.key_git, cmd_git, desc = M.name_git }
}

M.undo = {
    { M.key_undo, "<cmd>UndotreeToggle<cr>", desc = M.name_undo },
}

M.file = {
    { M.key_file, "<cmd>NvimTreeToggle<cr>", desc = M.name_file },
}

M.proj = {
}

M.term = {
    {
        M.key_term_f,
        "<cmd>ToggleTerm dir=git_dir direction=float<cr>",
        desc = M.name_term_f
    },
    {
        M.key_term_v,
        "<cmd>ToggleTerm dir=git_dir direction=vertical size=80<cr>",
        desc = M.name_term_v
    },
    {
        M.key_term_h,
        "<cmd>ToggleTerm dir=git_dir direction=horizontal size=20<cr>",
        desc = M.name_term_h
    },
}

M.mang_lsp = {
    { M.key_mang_lsp_a, "<cmd>LspInstall<cr>", desc = M.name_mang_lsp_a },
    { M.key_mang_lsp_d, "<cmd>LspUninstall<cr>", desc = M.name_mang_lsp_d },
}

return M;
