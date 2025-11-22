return {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    keys = {},
    opts = {
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        attach_to_untracked = true,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000, -- Disable if file is longer than this (in lines)

        -- TODO: this was throwing a warning, check if it's still needed
        -- yadm = {
        --     enable = false
        -- },

        watch_gitdir = {
            follow_files = true
        },

        signs = {
            add = { text = '│' },
            change = { text = '│' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
            untracked = { text = '┆' },
        },

        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 1000,
            ignore_whitespace = false,
        },

        preview_config = {
            -- Options passed to nvim_open_win
            border = 'single',
            style = 'minimal',
            relative = 'cursor',
            row = 0,
            col = 1
        },

        on_attach = function(buffer)
            local gs = package.loaded.gitsigns
            local function map(mode, l, r, opts)
                opts = opts or {}
                vim.keymap.set(mode, l, r, vim.tbl_extend("force", { buffer = buffer }, opts))
            end

            map("n", "<leader>gs", gs.stage_hunk, { desc = "Hunk stage" })
            map("n", "<leader>gr", gs.reset_hunk, { desc = "Hunk reset" })
            map('n', '<leader>gb', gs.toggle_current_line_blame, { desc = "Toggle blame"})


            map('n', '<leader>gi', gs.preview_hunk_inline, { desc = "Hunk preview"})

            map("n", "<leader>gn", function()
                gs.nav_hunk('next')
            end, { desc = "Hunk next" })
            map("n", "<leader>gp", function()
                gs.nav_hunk('prev')
            end, { desc = "Hunk next" })

        end

    }
}
