-- local theme_icons = require("etor.theme").theme_icons;

local path_gik = '/home/etor/Source/gik.new'
local path_zls = path_gik .. '/data/zig_zls'
local path_zls_bin = path_zls .. '/zig-out/bin/zls'
local path_zig = path_gik .. '/data/zig'
local path_zig_bin = path_zig .. '/build/stage3/bin/zig'
-- local path_zig_cache = path_gik .. '/.zig-cache'
-- local path_zig_builtin = path_zig .. '/lib/std/builtin.zig'
-- local path_zig_brunr = path_zig .. "/lib/compiler/build_runner.zig"

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },

        -- autocompletion
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp" },

        -- Lua-specific
        -- TODO: this should be loaded only when lua files are opened, don't know how though
        { "L3MON4D3/LuaSnip" },

        -- utilities for plugin development
        {
            "folke/neodev.nvim",
            ft = {"lua"}, -- onlu lua files
            opts = {}
        }
    },

    init = function()
        -- WARN: these should be added on etor/remaps/*, move them manually there.

        vim.keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "explore: Code Actions" })
        --

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { desc = "Definition" })

        -- set F2 to rename
        vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, { desc = "Rename" })

        vim.keymap.set({ "n", "i" }, "<C-h>", function() vim.lsp.buf.hover() end, { desc = "Hover" })
        vim.keymap.set({ "n", "i" }, "<C-/>", function() vim.diagnostic.open_float() end, { desc = "Show Diagnostic" })

        -- these are the defaults now
        -- vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, { desc = "Previous Diagnostic" })
        -- vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, { desc = "Next Diagnostic" })
    end,

    config = function()

        vim.diagnostic.config({
            -- Use pretty icons in sign column
            signs = {
                text = {
                [vim.diagnostic.severity.ERROR] = "",  -- Error sign
                [vim.diagnostic.severity.WARN] = "",  -- Warn sign
                [vim.diagnostic.severity.INFO] = "",  -- Info sign
                [vim.diagnostic.severity.HINT] = "",  -- Hint sign
                }
                -- You can also set `numhl` or `linehl` here if desired
            },
            underline = true,
            update_in_insert = true,
            virtual_text = true
        })

        local cmp = require("cmp")

        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            },

            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },

            sources = cmp.config.sources(
                {
                    { name = "nvim_lsp" }
                }, {
                    { name = 'buffer'}
                }
            ),

            mapping = {
                ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), {'i','c'}),
                ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), {'i','c'}),
                ["<CR>"] = cmp.mapping.confirm({
                    -- only complete if explicitly select it
                    select = false
                }),
                ['<C-Space>'] = cmp.mapping.complete(),
            }
        })

        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)

                local bufnr = args.buf

                vim.api.nvim_echo({ { "lsp attached: " .. client.name, "Normal" } }, true, {})

                -- Handle neodev for lua_ls
                if client.name == "lua_ls" then
                    require("neodev").setup({})
                end

                -- -- Stop ts_ls in Deno projects
                -- if client.name == "ts_ls" then
                --     local deno_markers = vim.fs.find({'deno.json', 'deno.jsonc'}, {
                --         upward = true,
                --         path = vim.api.nvim_buf_get_name(bufnr)
                --     })
                --     if #deno_markers > 0 then
                --         vim.api.nvim_echo({ { "ts_ls was stopped", "Normal" } }, true, {})
                --         vim.lsp.stop_client(client.id)
                --         return
                --     end
                -- end
            end
        })


        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                -- "zls", -- NOTE: I am compiling this from source on linux
                -- "rust_analyzer",
                -- "pyright",
                "clangd",
                -- "ts_ls",
                -- "eslint",
                -- "denols",
                "marksman", -- markdown
                "html",
                "cssls",
            },
            -- automatic_enable is true by default, will call vim.lsp.enable() for installed servers
        })


        vim.lsp.config('lua_ls', {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {
                            'vim'
                        }
                    },
                    telemetry = { enabled = false },
                    format = {
                        enable = true,
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
            root_markers = { '.git' }
        })
        vim.lsp.enable('lua_ls')

        vim.lsp.config('clangd', {
            root_markers = { '.clangd', '.git' },
            filetypes = { "c", "cuda" },
        })
        vim.lsp.enable('clangd')

        -- vim.lsp.config('denols', {
        --     root_markers = { 'deno.json', 'deno.jsonc' }
        -- })
        -- vim.lsp.enable('denols')

        -- vim.lsp.config('ts_ls', {
        --     root_markers = { 'package.json' },
        -- })
        -- vim.lsp.enable('ts_ls')
        --
        -- vim.lsp.config('eslint', {
        --     root_markers = { 'package.json' },
        -- })
        -- vim.lsp.enable('eslint')

        vim.lsp.config('marksman', {
            filetypes = { "markdown" },
            single_file_support = true,
        })
        vim.lsp.enable('marksman')

        -----------------------------------------------------


        -- NOTE: stuff you always forget:
        -- Docs: ./data/zig_zls/src/tools/config.json
        -- Logs are in: ~/.cache/zls/zls.log
        -- default global_cache_dir: ~/.cache/zls,
        -- you have to add a check step on your build.zig for built-on-save to work:
        --    https://zigtools.org/zls/guides/build-on-save/
        vim.lsp.config('zls', {
            cmd = { path_zls_bin, '--log-level', 'debug' },
            root_markers = { 'build.zig', 'build.zig.zon', '.zig-root' }, -- added .zig-root to recognize standalone files
            on_attach = function(lsp, num_bfr)
                _ = num_bfr
                orig_pwd = vim.fn.getcwd()
                vim.api.nvim_echo({
                    { "zls ", "Normal" },
                    { lsp.config.root_dir, "String" },
                }, true, {})

                -- autoformat before write
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = num_bfr,
                    callback = function()
                        vim.lsp.buf.format()
                    end,
                })

                -- handling :make and quickfix's parsing

                vim.bo.makeprg = "cd " .. lsp.config.root_dir .. " && " .. path_zig_bin .. " build"
                vim.bo.errorformat = table.concat({
                    -- Main error/warning format: file.zig:line:col: error: message
                    "%f:%l:%c: %trror: %m",
                    "%f:%l:%c: %tarning: %m",
                    "%f:%l:%c: %tote: %m",

                    "%f:%l:%c: %m",

                    -- Ignore lines that don't match
                    -- "%-G%.%#",
                }, ",")
                vim.api.nvim_buf_set_var(num_bfr, 'quickfix_root', lsp.config.root_dir)

                vim.api.nvim_create_autocmd("QuickFixCmdPre", {
                    buffer = num_bfr,
                    desc = "ZLS: Save CWD before make and change into root_dir to correctly resolve files",
                    callback = function()
                        vim.b.saved_cwd = vim.fn.getcwd()
                        vim.cmd("cd " .. lsp.config.root_dir)
                    end,
                })

                vim.api.nvim_create_autocmd("QuickFixCmdPost", {
                    buffer = num_bfr,
                    desc = "ZLS: Restore CWD after make",
                    callback = function()
                        vim.cmd("cd " .. orig_pwd)

                        -- determine if there are items on the quickfix
                        local qflist = vim.fn.getqflist()

                        -- print(vim.inspect(#qflist))
                        if #qflist > 0 then
                            vim.cmd.copen()
                            vim.cmd.cbottom()
                            vim.cmd("wincmd p")
                        end
                    end,
                })

                -- -- Clean up when LSP detaches
                -- vim.api.nvim_create_autocmd("LspDetach", {
                --     buffer = num_bfr,
                --     callback = function(args)
                --         -- Only clean up if it's this specific client detaching
                --         if args.data.client_id == lsp.id then
                --             vim.api.nvim_del_autocmd(format_autocmd)
                --         end
                --     end,
                -- })
            end,

            settings = {
                enable_snippets = true,
                enable_argument_placeholders = true,
                completion_label_details = true,
                enable_build_on_save = true,
                -- build_on_save_args = { '-fincremental' },
                semantic_tokens = "full",
                inlay_hints_show_variable_type_hints = true,
                inlay_hints_show_struct_literal_field_type = true,
                inlay_hints_show_parameter_name = true,
                inlay_hints_show_builtin = true,
                inlay_hints_exclude_single_argument = true,
                inlay_hints_hide_redundant_param_names = false,
                inlay_hints_hide_redundant_param_names_last_token = false,
                force_autofix = true,
                warn_style = false,
                highlight_global_var_declarations = false,
                skip_std_references = false,
                prefer_ast_check_as_child_process = true,
                zig_exe_path = path_zig_bin,
                -- global_cache_path = path_zig_cache,
                -- builtin_path = path_zig_builtin,
                -- build_runner_path = path_zig_brunr,
            },
        })
        vim.lsp.enable('zls')
    end,
};


