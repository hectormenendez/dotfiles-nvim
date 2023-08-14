-- @see :help nvim-tree-setup
local utils = require("etor.utils")
local remap_le = require("etor.remaps.leader-explore")

return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false, -- recomended by the docs
    dependencies = {},
    keys = utils.table_merge(remap_le.file),
    opts = {
        -- default: false; not really needed, because I killed it at load.
        disable_netrw = true,
        -- default: true; reload explored when a write happens.
        auto_reload_on_write = true,
        -- default: false; open nvimtree in place of unnamed buffer
        hijack_unnamed_buffer_when_opening = true,
        -- default: false; keeps the cursor on the first letter of each item
        hijack_cursor = true,
        -- default: {}; only relevant when `update_focused_file.update_root = true`
        --              preferred root directories
        root_dirs = {},
        -- default: false; only relevant when `update_focused_file.update_root = true`
        --              prefer `root_dirs` when updating root directory of the tree.
        prefer_startup_root = false,
        -- default: false; changes the tree root directory whevenver `DirChanged`
        --                 and refreshes the tree.
        sync_root_with_cwd = false,
        -- default: false; whenever entering a new buffer, reload the tree.
        reload_on_bufenter = false,
        -- default: false; when opening tree, it will change cwd to curren't buyffer path
        respect_buf_cwd = true,
        -- default: {}; take control when a dir buffer is opened
        hijack_directories = {
            -- disable this if using: vim-dirvish or dirbuf.nvim
            enable = true,
            auto_open = true,
        },
        -- default: {}; update focused file on tree on BufEnter.
        --              uncollapses the folders recursively until it finds the file
        update_focused_file = {
            enable = true,
            -- default: false; if the file is not under current root directory
            --                 sets the new root, falls back the containing folder.
            update_root = true, -- related to prefer_startup_root
            ignore_list = {}
        },
        -- handles opening a file with a dedicated app.
        system_open = {
            -- default: "";
            cmd = "spacefm",
            args = {},
        },
        -- depends on: `renderer.icons.show.git` or `renderer.highlight_git`
        git = {
            enable = true,
            -- show status icons on directories
            show_on_dirs = true,
            show_on_open_dirs = true,
            -- disable the functionality for these dirs
            disable_for_dirs = {},
        },
        -- sorting for files and folders
        sort = {
            -- default: name; available: modification_time, extension, suffix, filetype
            sorter = "case_sensitive",
            -- default: true;
            folders_first = true,
        },
        -- shows whether files have modifications
        -- dependes on `renderer.icons.show.modified` or `renderer.highlight_modified`
        modified = {
            -- default: false;
            enable = true,
            show_on_dirs = true,
            show_on_open_dirs = true,
        },
        -- modify the window behaviour
        view = {
            -- default: false; the initial node will be the one in the middle
            centralize_selection = true,
            -- default: true; enable the cursor line in the tree
            cursorline = true,
            width = {
                min = 40,
                max = "40%",
                padding = 1,
            },
            side = "right",
            preserve_window_proportions = false,
            -- enable line numbers
            number = false,
            relativenumber = false,
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
        renderer = {
            -- default: true; resolve the link?
            symlink_destination = true,
            -- default: false; adds a trailing slahs to dirs
            add_trailing = true,
            -- default: false; make empty dirs compact
            group_empty = true,
            -- if the name is wider than the window, show it ina float
            full_name = false,
            -- depends on `git` setting
            highlight_git = true,
            -- default: none; available: "icon", "name", "all".
            highlight_opened_files = "all",
            -- depends on `modified` setting
            highlight_modified = "icon",
            -- default: 2;
            indent_width = 4,
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
