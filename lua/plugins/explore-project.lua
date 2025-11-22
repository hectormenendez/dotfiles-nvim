local remap_le = require("etor.remaps.leader-explore")

-- NOTE: To create a project:
-- 1. open a new nvim instance
-- 2. cd to the project root
-- 3. make sure no buffers are open
-- 4. :WorkspacesAdd

return {
    "natecraddock/workspaces.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        {
            "natecraddock/sessions.nvim",
            config = true,
            opts = {
                -- needed for workspaces
                absolute = true,
                session_filepath = vim.fn.stdpath("data") .. "/sessions",
            }
        }
    },
    lazy = true,
    config = true,
    keys = remap_le.proj,
    opts = {
        path = vim.fn.stdpath("data") .. "/workspaces",
        -- overrides native cd
        cd_type = "global",
        -- sort by recency
        sort = true,
        mru_sort = true,
        auto_open = false,
        notify_info = true,
        hooks = {
            open_pre = function(ws_name, pwd)
                -- important so it does not save this window in the session
                vim.cmd("NvimTreeClose")
                -- saves current sesion and stops recording
                vim.cmd("SessionsStop")
                -- removes all buffers
                vim.cmd("bufdo bd!")
            end,
            open = function()
                -- loads the session for current workspace
                require("sessions").load(nil, { silent = false });
            end,
            add = function()
                vim.cmd("SessionsSave")
            end,
        },
    },
    init = function()
        require("workspaces");
    end,
}
