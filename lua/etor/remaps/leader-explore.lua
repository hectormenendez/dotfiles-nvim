local M = {}

M.name = "explore: ";
M.name_term = M.name.."term"
M.name_proj = M.name.."projects"
M.name_inst = M.name.."installers"

M.key = "<leader>e";
M.key_term = M.key.."t"
M.key_proj = M.key.."p"
M.key_inst = M.key.."i"


require("etor.utils").onload(function()
    local wk = require("which-key")
    wk.register({ [M.key] = { name = M.name } })
    wk.register({ [M.key_term] = { name = M.name_term } })
    wk.register({ [M.key_proj] = { name = M.name_proj } })
    wk.register({ [M.key_inst] = { name = M.name_inst } })

    -- adds lazy keybinding
    vim.api.nvim_set_keymap(
        "n",
        M.key_inst.."p",
        ":Lazy<cr>",
        { noremap = true, silent = true, desc = M.name.."plugins" }
    );
end)


M.inst_lsp = {
    { M.key_inst.."s", "<cmd>LspInstall<cr>", desc = "language servers" },
}

M.projects = {
    { M.key_proj.."p", "<cmd>Autosession search<cr>", desc = M.name_proj },
    { M.key_proj.."d", "<cmd>Autosession delete<cr>", desc = M.name_proj.."delete" },
}

M.alerts = {
    { M.key.."a", "<cmd>TroubleToggle<cr>", desc = M.name.."alerts" },
}

M.content = {
    {
        M.key.."/",
        "<cmd>lua require('spectre').toggle()",
        desc = M.name.."search & replace"
    },
}

M.files = {
    { M.key.."f", "<cmd>NvimTreeToggle<cr>", desc = M.name.."files" },
}

M.term = {

    {
        M.key_term.."v",
        "<cmd>ToggleTerm dir=git_dir direction=vertical size=80<cr>",
        desc = M.name_term.."vertical split",
    },
    {
        M.key_term.."s",
        "<cmd>ToggleTerm dir=git_dir direction=horizontal size=20<cr>",
        desc = M.name_term.."split",
    },
}

M.git = {
    {
        M.key.."g",
        table.concat({
            "<cmd>",
            "TermExec",
            [[cmd="lazygit --git-dir=$(git rev-parse --git-dir) && exit 0"]],
            "direction=float",
            "go_back=0",
            "<cr>",
        }, " "),
        desc = M.name.."git",
    }
}

M.undo = {
    { M.key.."u", "<cmd>UndotreeToggle<cr>", desc = M.name.."undo-tree" },
}

return M;
