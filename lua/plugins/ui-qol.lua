return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- not interested in animating things
        animate = { enabled = false },
        scroll = { enabled = false },

        -- disables lsp, treesitter, etc when file is big
        bigfile = {
            notify = true,
            enabled = true,
            size = 0.5 * 1024 * 1025, -- 500Kb, maybe relax this a little?
        },

        -- deletes buffers without disrupting layout behavior
        bufdelete = { enabled = true },

        -- I want to keep thins simple, this is pretty, but doesn't provide a value for me
        dashboard = { enabled = false },

        -- utility functions for lua, not really useful for me rn.
        debug = { enabled = false },

        -- acts like a marker, graying out everything but the current block
        -- needs to have keybindings to make it useful, unless presenting stuff, I don't
        -- think I'm going to use this much.
        dim = { enabled = false },

        -- I already have a file explorer, thank you very much
        explorer = { enabled = false },

        -- I don't need this eye candy, thank yo.
        git = { enabled = false },
        gitbrowse = { enabled = false },

        -- enables viewing images using kitty protocol, I want to keep my setup TTY
        -- friendly, so no thanks.
        image = { enabled = false },

        -- I already have a plugin for indenting and guides, so no.
        indent = { enabled = false },

        -- had to enabled this because the plugin messed with my default L&F
        input = { enabled = true },

        layout = { enabled = false },
        lazygit = { enabled = false },
        notifier = { enabled = false },

        -- had to enabled this one, because it messed up with my telescope look and feel
        -- on the project selection screen
        picker = { enabled = true },

        -- when opening a file directly from the command line, loads it as quick as
        -- possible by disabling plugins, which yeah, I don't like.
        quickfile = { enabled = false },

        -- not needed
        scope = { enabled = false },

        -- the vanilla facilities are enough, thank you very much
        scratch = { enabled = false },

        -- already have this covered, thank you.
        statuscolumn = { enabled = false },

        -- yeah, no, I've already have this covered elsewhere
        terminal = { enabled = false },
        words = { enabled = false },
        zen = { enabled = false },
    },
}
