local utils = require("etor.utils")

utils.onload(function()
    local lsp = require("lsp-zero").preset({})

    lsp.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings to learn the available actions
        lsp.default_keymaps({ buffer = bufnr })
    end)

    lsp.extend_cmp()

    require("mason").setup({})

    require("mason-lspconfig").setup({
        handlers = {lsp.default_setup},
        ensure_installed = {
            "tsserver",
            "eslint",
            "lua_ls",
            "rust_analyzer"
        },
    })
end)

return {
    -- TODO: on Sept 2023, this will be main, check that
    { "VonHeikemen/lsp-zero.nvim", branch = "dev-v3" },

    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

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
            { "L3MON4D3/LuaSnip" },
        }
    }
}
