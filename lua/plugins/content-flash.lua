local function flash_fwd()
    require('flash').jump({ forward = true, wrap = false, multi_window = true })
end

local function flash_bak()
    require("flash").jump({
        search = { forward = false, wrap = false, multi_window = true }
    })
end

return {
    "folke/flash.nvim",
    keys = {
        { "gs", flash_fwd, desc="go: search: forwards" },
        { "gS", flash_bak, desc="go: search: backwards" },
        { "<C-s>", mode = { "i" }, flash_fwd, desc="go: search: forwards" },
        -- for this to work you have to send the chord `\x1b[83;5u` from your terminal
        { "<C-S-s>", mode = { "i" }, flash_bak, desc="go: search: backwards" }
    },
    opts = {},
}
