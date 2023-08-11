return {
    "VonHeikemen/lsp-zero.nvim",
    -- TODO: on Sept 2023, this will be main, check that
    branch = "dev-v3",
    dependencies = {
        -- LSP Support
        {
            "neovim/nvim-lspconfig",
            dependencies = {
                { "hrsh7th/cmp-nvim-lsp" },
            },
        },

        -- Autocompletion
        {
            "hrsh7th/nvim-cmp",
            dependencies = {
                { "L3MON4D3/LuaSnip" }
            }
        },

        -- automatic servers handling
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },

        -- utilities for lua plugin development
        { "folke/neodev.nvim", opts={} },
    },

    config = function()
        local lsp = require("lsp-zero").preset({})

        lsp.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings to learn the available actions
            lsp.default_keymaps({ buffer = bufnr })
        end)

        lsp.extend_cmp()

        local cmp = require("cmp")
        cmp.setup({
            mapping = {
                ["<cr>"] = cmp.mapping.confirm({ select = false })
            }
        })

        require("mason").setup({})

        require("mason-lspconfig").setup({
            handlers = { lsp.default_setup },
            ensure_installed = {
                "tsserver",
                "eslint",
                "lua_ls",
                "rust_analyzer"
            },
        })

        require("neodev").setup({})
    end
}

