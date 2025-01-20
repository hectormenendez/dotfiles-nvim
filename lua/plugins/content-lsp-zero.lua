local theme_icons = require("etor.theme").theme_icons;

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
                { "L3MON4D3/LuaSnip", run = "make install_jsregexp" }
            }
        },

        -- automatic servers handling
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },

        -- utilities for lua plugin development
        { "folke/neodev.nvim", opts = {} },

        -- snippets
        { "L3MON4D3/LuaSnip", opts = {} },
    },
    init = function()
        -- TODO: Set these in the corresponding remap files
        vim.keymap.set("n", "ea", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "explore: Code Actions" })
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { desc = "Definition" })
        vim.keymap.set("n", "gR", function() vim.lsp.buf.references() end, { desc = "References" })
        vim.keymap.set({ "n", "i" }, "<C-h>", function() vim.lsp.buf.hover() end, { desc = "Hover" })
        vim.keymap.set({ "n", "i" }, "<C-/>", function() vim.diagnostic.open_float() end, { desc = "Show Diagnostic" })
    end,
    config = function()
        local lsp = require("lsp-zero").preset({
            -- none, single, double, rounded, solid, shadow
            float_border = "single",
            -- reserve space in the gutter for glyphs showing status of line
            set_signcolumn = true,
            -- whether to integrate with nvim-cmp using lspconfig
            extend_lspconfig = true,
        })

        lsp.set_sign_icons(theme_icons.diagnostics)

        lsp.extend_cmp({
            -- whether to add `cmp-nvim-lsp` as a source
            set_lsp_source = true,
            -- whether to emulate neovim's default completion bindings
            set_mappings = true,
            -- whether to use luasnip to expand snippets
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
                ['<C-Space>'] = cmp.mapping.complete(),
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
                -- "zls", -- i am installing this manually now
                -- "pyright", -- python
                "clangd",
                "ts_ls",
                "eslint",
                "denols",
                "marksman", -- markdown
            },
            handlers = {
                lsp.default_setup,
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

        local nvim_lsp = require('lspconfig')

        local on_attach = function(client)
            if nvim_lsp.util.root_pattern("deno.json", "deno.jsonc")(vim.fn.getcwd()) then
                -- write a message in order to determine if this is running
                if client.name == "ts_ls" then
                    vim.api.nvim_echo({ { "ts_ls was stopped", "Normal" } }, true, {})
                    client.stop()
                    return
                end
            end
        end

        nvim_lsp.lua_ls.setup(lsp.nvim_lua_ls({
            on_attach = function(client, bufnr)
                require("neodev").setup({})
            end,
            settings = {
                Lua = {
                    telemetry = { enabled = false },
                    format = {
                        enable = true,
                        -- who still thinks this is a good idea?
                        defaultConfig = {
                            align_call_args = "false",
                            align__params = "false",
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
            -- root_dir = function()
            --     -- TODO: Improve this
            --     return util.find_git_ancestor(vim.fn.getcwd()) or vim.loop.cwd()
            -- end,
        }))

        nvim_lsp.clangd.setup {
            on_attach = on_attach,
            root_dir = nvim_lsp.util.root_pattern(".clangd"),
            filetypes = { "c", "cuda" },
            single_file_support = true,
        }

        nvim_lsp.denols.setup {
            on_attach = on_attach,
            root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
        }

        nvim_lsp.ts_ls.setup {
            on_attach = on_attach,
            root_dir = nvim_lsp.util.root_pattern("package.json"),
            single_file_support = false
        }

        -- nvim_lsp.zls.setup {
        --     on_attach = on_attach,
        --     root_dir = nvim_lsp.util.root_pattern(".git"),
        --     -- TODO: this should be called with a config path
        --     cmd = { "/home/etor/Source/gik.new/data/zig_zls/zig-out/bin/zls" },
        --     settings = {
        --         -- Docs: gik.new/data/zig_zls/src/tools/config.json
        --         zls = {
        --             zig_exe_path = "/home/etor/Source/gik.new/zig",
        --             -- global_cache_path = "/home/etor/Source/gik.new/.zig-cache",
        --             highlight_global_var_declarations = true,
        --             warn_style = true,
        --             semantic_tokens = "full",
        --             enable_build_on_save = true,
        --             enable_snippets = true,
        --         },
        --     },
        -- }
        --
        nvim_lsp.marksman.setup {}
    end
}

