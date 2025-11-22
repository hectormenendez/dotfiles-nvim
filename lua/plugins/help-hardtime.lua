return {
    "m4xshen/hardtime.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim"
    },
    opts = {
        enabled = true,
        max_time = 4000, -- time to wait before considering a key repeated
        max_count = 9, -- max keypresses within max_time
        disable_mouse = false,
        hint = true, -- shows hints on how to do it right
        allow_different_key = true, -- typing different key resets the count
        restriction_mode = "block" -- "block" or "hint"
    }
}
