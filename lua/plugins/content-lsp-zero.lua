local theme_icons = require("etor.theme").theme_icons;
local remaps_le = require("etor.remaps.leader-explore");
local utils = require("etor.utils");

return {
    "VonHeikemen/lsp-zero.nvim",
    -- TODO: on Sept 2023, this will be main, check that
    branch = "dev-v3",
    dependencies = {
        -- lsp support
        {
            "neovim/nvim-lspconfig",
            dependencies = {
                { "hrsh7th/cmp-nvim-lsp" },
            },
        },

        -- autocompletion
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
        { "folke/neodev.nvim", opts = {} },
    },
    init = function()
        ---@diagnostic disable-next-line: unused-local
        for _i, remap in pairs(remaps_le.mang_lsp) do
            vim.keymap.set("n", remap[1], remap[2], remap[3])
        end
    end,
    config = function()
        local lsp = require("lsp-zero").preset({
            -- none, single, double, rounded, solid, shadow
            float_border = "single",
            -- reserve space in the gutter for glyphs showing status of line
            set_signcolumn = true,
            -- whether to integrate wtihe nvim-cmp using lspconfig
            extend_lspconfig = true,
        })

        lsp.set_sign_icons(theme_icons.diagnostics)

        lsp.extend_cmp({
            -- whether to add `cmp-nvim-lsp` as a source
            set_lsp_source = true,
            -- whether to emulate neovim's default completion bindings
            set_mappings = true,
            -- whether to use luasnp to expand snippets
            use_luasnip = true,
            -- whether the completion items will show a label identifying the source
            set_format = true,
            -- whether to configure the max height and width of documentation window
            documentation_window = true,
        })
        local cmp = require("cmp")
        local cmp_action = require("lsp-zero").cmp_action();
        cmp.setup({
            sources = {
                { name = "nvim_lsp" }
            },
            window = {
                -- completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
            },
            mapping = {
                ["<cr>"] = cmp.mapping.confirm({ select = false }),
                ["<C-f>"] = cmp_action.luasnip_jump_forward(),
                ["<C-b>"] = cmp_action.luasnip_jump_backward(),
            }
        })

        -- sets up lua in nvim
        lsp.extend_lspconfig()

        -- automatic server handling
        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "zls", -- zig
                "tsserver",
                "eslint",
            },
            handlers = {
                lsp.default_setup,
                lua_ls = function()
                    -- this needs to be adapted because it assumes neovim lua
                    -- is the only lua project in system
                    require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls({
                        settings = {
                            Lua = {
                                telemetry = { enabled = false },
                                format = {
                                    enable = true,
                                    -- who the fuck still thinks this is a good idea?
                                    defaultConfig = {
                                        align_call_args = "false",
                                        align_function_params = "false",
                                        align_continuous_assign_statement = "false",
                                        align_continuous_rect_table_field = "false",
                                        align_if_branch = "false",
                                        align_array_table = "false",
                                        align_continuous_similar_call_args = "false",
                                        align_continuous_inline_comment = "false",
                                    },
                                },
                            },
                        },
                        on_attach = function()
                            require("neodev").setup({})
                        end,
                    }))
                end
            },
        })

        ---@diagnostic disable-next-line: unused-local
        lsp.on_attach(function(_client, buffer)
            -- see :help lsp-zero-keybindings to learn the available actions
            lsp.default_keymaps({ buffer })

            -- take this for a ride to understand what it does
            lsp.buffer_autoformat()

            -- NOTE: Insert keybindings here
        end)
    end
}
