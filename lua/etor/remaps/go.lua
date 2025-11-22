local utils = require("etor.utils")

local M = {};

M.name = "go: "
M.key = "g"

require("etor.utils").onload(function()
    local wk = require("which-key")
    wk.add({ M.key, desc = M.name })
end)

M.name_search = M.name .. "search: "

M.lsp = {
    { "gr", "<cmd>Telescope lsp_references<cr>", desc = "lsp_reference" }
}


return M;
