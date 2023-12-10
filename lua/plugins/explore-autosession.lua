local utils = require("etor.utils");
local remaps_le = require("etor.remaps.leader-explore");
local remaps_lf = require("etor.remaps.leader-find");

utils.onload(function()
    -- require("telescope").load_extension("session-lens")
end)

return {
    "rmagatti/auto-session",
    lazy = false,
    keys = utils.table_merge(remaps_le.proj),
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        vim.o.sessionoptions = table.concat({
            "blank",
            "buffers",
            "curdir",
            "folds",
            "help",
            "tabpages",
            "winsize",
            "winpos",
            "terminal",
            "localoptions",
        }, ",")

        require("auto-session").setup({
            -- Sets the log level of the plugin

            -- Determines if the last session should be restored
            auto_session_enable_last_session = vim.loop.cwd() ~= vim.loop.os_homedir(),
            -- Changes the root dir for sessions
            auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
            -- Enables/disables the plugin's auto save and restore features
            auto_session_enabled = true,
            -- Enables/disables the plugin's session auto creation
            auto_session_create_enabled = true,
            -- Enables/disables auto saving
            auto_save_enabled = true,
            -- Enables/disables auto restoring
            auto_restore_enabled = true,
            -- Use the git branch to differentiate the session name
            auto_session_use_git_branch = false,
            -- Suppress session create/restore if in one of the list of dirs
            auto_session_suppress_dirs = {
                "/",
                "~/",
                "~/Source",
                "~/Downloads",
            },
            -- table: Bypass auto save when only buffer open is one of these file types
            bypass_session_save_file_types = nil,
            -- table: handles the DirChangePre and DirChanged autocmds, can be `nil`
            cwd_change_handling = {
                -- boolean: restore session for upcoming cwd on cwd change
                restore_upcoming_session = true,
                -- function: called after auto_session code runs `DirChangedPre`
                pre_cwd_changed_hook = nil,
                -- function: called after auto_session code runs `DirChanged`
                function()
                    -- TODO: this is  only a test, delete it.
                    -- refresh lualine so the new session name is displayed in the status bar
                    require("lualine").refresh()
                end,
            },
            session_lens = {
                load_on_setup = true, -- will be triggered by key
                theme_conf = { border = true },
                previewer = true,
            },
        })
    end,
}
