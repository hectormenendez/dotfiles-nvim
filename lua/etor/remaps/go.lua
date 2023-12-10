local utils = require("etor.utils")

local M = {};

M.name = "go: "
M.key = "g"

require("etor.utils").onload(function()
    local wk = require("which-key")
    wk.register({ [M.key] = { name = M.name } })
end)

M.name_search = M.name .. "search: "

local flash_opt = { wrap = false, multi_window = false };
local flash_fn_fwd = function()
    require('flash').jump(utils.table_merge(flash_opt, { forward = true }))
end
local flash_fn_bak = function()
    require('flash').jump(utils.table_merge(flash_opt, { forward = true }))
end

M.flash = {
    { "g/", flash_fn_fwd, desc = M.name_search .. "forwards" },
    { "g?", flash_fn_bak, desc = M.name_search .. "backwards" },

    -- for <C-S-s> to work you have to send the chord `\x1b[83;5u` from your terminal
    { "<C-s>", mode = { "i" }, flash_fn_fwd, desc = M.name_search .. "forwards" },
    { "<C-S-s>", mode = { "i" }, flash_fn_bak, desc = M.name_search .. "backwards" },
}

M.lsp = {
    { "gr", "<cmd>Telescope lsp_references<cr>", desc = "lsp_reference" }
}


return M;
