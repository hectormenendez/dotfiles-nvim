-- @see :help nvim-tree-setup
local utils = require("etor.utils")
local remap_le = require("etor.remaps.leader-explore")

return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false, -- recomended by the docs
    dependencies = {},
    keys = utils.merge(remap_le.files),
    opts = {
        reload_on_bufenter = true,
        auto_reload_on_write = false,
        sync_root_with_cwd = true,
        prefer_startup_root = false,
        respect_buf_cwd = false,
        disable_netrw = true,
        hijack_netrw = true,
        hijack_cursor = true,
        hijack_unnamed_buffer_when_opening = true,

        hijack_directories = {
            enable = true,
            auto_open = true,
        },

        sort = {
            sorter = "case_sensitive",
            folders_first = true,
        },

        update_focused_file = {
            enable = true,
            update_root = true,
            ignore_list = {}
        },

        view = {
            width = 40,
            centralize_selection = true,
            cursorline = false,
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
            change_dir = {
                enable = true
            },
            open_file = {
                quit_on_open = true,
                resize_window = true,
            },
        },

        git = {
            enable = true,
            ignore = true,
        },

        renderer = {
            group_empty = true,
            highlight_git = true,
            indent_width = 4,
            symlink_destination = true,
            full_name = false,
            highlight_opened_files = "name",

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

