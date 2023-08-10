-- @see :help nvim-tree-setup
return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false, -- recomended by the docs
    dependencies = {},
    keys = {
        { "<C-w>e", "<cmd>NvimTreeToggle<cr>", "Window: Exporer" },
    },
    opts = {
        auto_reload_on_write = false,
        hijack_cursor = false,
        hijack_unnamed_buffer_when_opening = false,
        prefer_startup_root = false,
        sync_root_with_cwd = true,
        reload_on_bufenter = false,
        respect_buf_cwd = false,
        sort = {
            sorter = "case_sensitive",
            folders_first = true,
        },
        view = {
            width = 40,
            centralize_selection = false,
            cursorline = true,
            hide_root_folder = false,
            side = "right",
            mappings = {
                custom_only = false,
                list = {
                    -- custom mappings go here
                }
            }
        },
        filters = {
            dotfiles = true,
            git_ignored = false,
            custom = {
                ".git$",
                ".pyc$",
                "node_modules$",
            },
        },
        actions = {
            open_file = {
                quit_on_open = true,
            },
        },
        renderer = {
            group_empty = true,
            highlight_git = true,
            indent_width = 4,
            symlink_destination = true,
            special_files = {},
            indent_markers = {
                enable = true,
                inline_arrows = true,
                icons = {
                    corner = "└",
                    edge = "│",
                    item = "│",
                    bottom = "─",
                    none = " ",
                },
            },
            special_files = {
                "README.md",
                "package.json",
            },
            icons = {
                webdev_colors = true,
                git_placement = "after",
                modified_placement = "before",
                padding = " ",
                symlink_arrow = "->",
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = true,
                    modified = true,
                },
                glyphs = {
                    default = "",
                    symlink = "🔗",
                    bookmark = "🔖",
                    modified = "●",
                    git = {
                        unstaged = "~",
                        staged = "+",
                        unmerged = "!",
                        renamed = "➜",
                        untracked = "?",
                        deleted = "-",
                        ignored = "◌",
                    },
                    folder = {
                        arrow_closed = "►",
                        arrow_open = "▼",
                        default = "📁",
                        symlink = "🔗",
                        symlink = "*🔗",
                        open = "📂",
                        empty = "📁",
                        empty_open = "📂",
                    }
                },
            },
        }
    }
}

