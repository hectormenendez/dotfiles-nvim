return {
    "shortcuts/no-neck-pain.nvim",
    config = function()
        local self = require("no-neck-pain")
        self.setup({
            -- default: true
            debug = false,
            -- default: 100
            width = 130,
            -- default: 10
            minSideBufferWidth = 50,
            -- default: false
            disableOnLastBuffer = false,
            -- default: false
            killAllBuffersOnDisable = false,

            autocmds = {
                -- default: false
                enableOnVimEnter = false,
                -- default: false
                enableOnTabEnter = true,
                -- default: false
                reloadOnColorSchemeChange = false,
                -- default: false
                skipEnteringNoNeckPainBuffer = false,
            },
            mappings = {
                -- create mappings not explicitly set, to false.
                -- default: false
                enabled = false,
            },
            buffers = {
                -- default: false
                setNames = false,
                colors = self.bufferOptionsColors,
                scratchPad = {
                    enabled = false,
                },
            },
            integrations = {
                NvimTree = {
                    -- default: "left"
                    position = "right",
                    -- default: false
                    reopen = true,
                },
                undotree = {
                    -- default: "left"
                    position = "left",
                },
            }
        })
    end,
}
