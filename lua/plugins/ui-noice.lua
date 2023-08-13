local utils = require("etor.utils")
local c = require("etor.theme").theme_colors;

utils.onload(function()
    utils.highlighter({
        NoiceCmdlineIcon = { guifg = c.darkst, guibg = "None" },
        NoiceCmdlinePopup = { guifg = c.mode_c_fg, guibg = c.darkst },
        NoiceCmdlinePopupBorder = { guifg = c.mode_c_bg, guibg = "None" },
        NoiceCmdlinePopupTitle = { guifg = c.mode_c_bg, guibg = "None" },
        NotifyBackground = { guibg = c.darkst },
    })
end)

return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    config = function()
        local notify_render_base = require("notify.render.base");
        require("noice").setup({
            cmdline = {
                enabled = true,
                format = {
                    cmdline = { icon = "" }, -- { icon = ":" },
                    search_down = { icon = "" }, --{ icon = "🔎" },
                    search_up = { icon = "" }, --{ icon = "🔍" },
                    help = { icon = "" }, --{ icon = "?" }
                }
            },
            lsp = {
                hover = {
                    enabled = false,
                },
                signature = {
                    enabled = false,
                },
                -- override markdown rendering so that `cmp`
                -- and other plugins use `Treesitter`
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                long_message_to_split = true
            },
            routes = {
                -- show change mode messages, but ignore certain ones.
                {
                    view = "notify",
                    filter = {
                        event = "msg_showmode",
                        cond = function(message)
                            if (message.event ~= "msg_showmode") then return false end
                            for _k, v in pairs(message._lines) do
                                local content = v:content();
                                local has_insert = content:find("-- INSERT") ~= nil
                                local has_visual = content:find("-- VISUAL") ~= nil
                                local has_terminal = content:find("-- TERMINAL") ~= nil
                                if has_insert or has_visual or has_terminal then
                                    return false
                                end
                            end
                            return true
                        end
                    }
                },
            },
            views = {
                -- customize notifications
                notify = {
                    stages = "slide",
                    fps = 60,
                    timeout = 3000,
                    top_down = false,
                    icons = {
                        ERROR = "E",
                        WARN = "W",
                        INFO = "I",
                        DEBUG = "D",
                        TRACE = "T"
                    },
                    -- @see https://github.com/rcarriga/nvim-notify/blob/master/lua/notify/render/minimal.lua
                    render = function(id_bu, notification, highlights)
                        -- prepend a space so notification text have a little more room
                        local message = vim.tbl_map(
                            function(line) return " " .. line end,
                            notification.message
                        )
                        vim.api.nvim_buf_set_lines(id_bu, 0, -1, false, message)
                        local id_ns = notify_render_base.namespace()
                        vim.api.nvim_buf_set_extmark(id_bu, id_ns, 0, 0, {
                            hl_group = highlights.icon,
                            end_line = #notification.message - 1,
                            end_col = #notification.message[#notification.message],
                            priority = 50,
                        })
                    end,
                },
                -- make the cmdline and popupmenu appear together
                cmdline_popup = {
                    position = { row = -2, col = 0 },
                    size = { width = "100%", height = "auto" },
                    border = {
                        style = "none",
                        padding = { 1, 1 },
                        text = {
                            top = "",
                            top_align = "right",
                        },
                    },
                },
                popupmenu = {
                    relative = "editor",
                    position = { row = -5, col = 0 },
                    size = { width = "100%", height = "auto" },
                    border = {
                        style = "none",
                        padding = { 1, 2 }
                    }
                }
            },
        })
    end,
}

-- NoiceCmdLine = { guifg = "lime", guibg = "green" },
-- NoiceCmdlineIconCalculator = { guifg = "lime", guibg = "green" }
-- NoiceCmdlineIconCmdline = { guifg = "lime", guibg = "green" }
-- NoiceCmdlineIconFilter = { guifg = "lime", guibg = "green" }
-- NoiceCmdlineIconHelp = { guifg = "lime", guibg = "green" }
-- NoiceCmdlineIconIncRename = { guifg = "lime", guibg = "green" }
-- NoiceCmdlineIconInput = { guifg = "lime", guibg = "green" }
-- NoiceCmdlineIconLua = { guifg = "lime", guibg = "green" }
-- NoiceCmdlineIconSearch = { guifg = "lime", guibg = "green" }
-- NoiceCmdlinePopupBorder = { guifg = "lime", guibg = "green" }
-- NoiceCmdlinePopupBorderCalculator = { guifg = "lime", guibg = "green" }
-- NoiceCmdlinePopupBorderCmdline = { guifg = "lime", guibg = "green" }
-- NoiceCmdlinePopupBorderFilter = { guifg = "lime", guibg = "green" }
-- NoiceCmdlinePopupBorderHelp = { guifg = "lime", guibg = "green" }
-- NoiceCmdlinePopupBorderIncRename = { guifg = "lime", guibg = "green" }
-- NoiceCmdlinePopupBorderInput = { guifg = "lime", guibg = "green" }
-- NoiceCmdlinePopupBorderLua = { guifg = "lime", guibg = "green" }
-- NoiceCmdlinePopupBorderSearch = { guifg = "lime", guibg = "green" }
-- NoiceCmdlinePopupTitle = { guifg = "lime", guibg = "green" }
-- NoiceCmdlinePrompt = { guifg = "lime", guibg = "green" }
-- NoiceCompletionItemKindClass = { guifg = "lime", guibg = "green" }
-- NoiceCompletionItemKindColor = { guifg = "lime", guibg = "green" }
-- NoiceCompletionItemKindConstant = { guifg = "lime", guibg = "green" }
-- NoiceCompletionItemKindConstructor = { guifg = "lime", guibg = "green" }
-- NoiceCompletionItemKindDefault = { guifg = "lime", guibg = "green" }
-- NoiceCompletionItemKindEnum = { guifg = "lime", guibg = "green" }
-- NoiceCompletionItemKindEnumMember = { guifg = "lime", guibg = "green" }
-- NoiceCompletionItemKindField = { guifg = "lime", guibg = "green" }
-- NoiceCompletionItemKindFile = { guifg = "lime", guibg = "green" }
-- NoiceCompletionItemKindFolder = { guifg = "lime", guibg = "green" }
-- NoiceCompletionItemKindFunction = { guifg = "lime", guibg = "green" }
-- NoiceCompletionItemKindInterface = { guifg = "lime", guibg = "green" }
-- NoiceCompletionItemKindKeyword = { guifg = "lime", guibg = "green" }
-- NoiceCompletionItemKindMethod = { guifg = "lime", guibg = "green" }
-- NoiceCompletionItemKindModule = { guifg = "lime", guibg = "green" }
-- NoiceCompletionItemKindProperty = { guifg = "lime", guibg = "green" }
-- NoiceCompletionItemKindSnippet = { guifg = "lime", guibg = "green" }
-- NoiceCompletionItemKindStruct = { guifg = "lime", guibg = "green" }
-- NoiceCompletionItemKindText = { guifg = "lime", guibg = "green" }
-- NoiceCompletionItemKindUnit = { guifg = "lime", guibg = "green" }
-- NoiceCompletionItemKindValue = { guifg = "lime", guibg = "green" }
-- NoiceCompletionItemKindVariable = { guifg = "lime", guibg = "green" }
-- NoiceCompletionItemMenu = { guifg = "lime", guibg = "green" }
-- NoiceCompletionItemWord = { guifg = "lime", guibg = "green" }
-- NoiceConfirm = { guifg = "lime", guibg = "green" }
-- NoiceConfirmBorder = { guifg = "lime", guibg = "green" }
-- NoiceCursor = { guifg = "lime", guibg = "green" }
-- NoiceFormatConfirm = { guifg = "lime", guibg = "green" }
-- NoiceFormatConfirmDefault = { guifg = "lime", guibg = "green" }
-- NoiceFormatDate = { guifg = "lime", guibg = "green" }
-- NoiceFormatEvent = { guifg = "lime", guibg = "green" }
-- NoiceFormatKind = { guifg = "lime", guibg = "green" }
-- NoiceFormatLevelDebug = { guifg = "lime", guibg = "green" }
-- NoiceFormatLevelError = { guifg = "lime", guibg = "green" }
-- NoiceFormatLevelInfo = { guifg = "lime", guibg = "green" }
-- NoiceFormatLevelOff = { guifg = "lime", guibg = "green" }
-- NoiceFormatLevelTrace = { guifg = "lime", guibg = "green" }
-- NoiceFormatLevelWarn = { guifg = "lime", guibg = "green" }
-- NoiceFormatProgressDone = { guifg = "lime", guibg = "green" }
-- NoiceFormatProgressTodo = { guifg = "lime", guibg = "green" }
-- NoiceFormatTitle = { guifg = "lime", guibg = "green" }
-- NoiceLspProgressClient = { guifg = "lime", guibg = "green" }
-- NoiceLspProgressSpinner = { guifg = "lime", guibg = "green" }
-- NoiceLspProgressTitle = { guifg = "lime", guibg = "green" }
-- NoiceMini = { guifg = "lime", guibg = "green" }
-- NoicePopup = { guifg = "lime", guibg = "green" }
-- NoicePopupBorder = { guifg = "lime", guibg = "green" }
-- NoicePopupmenu = { guifg = "lime", guibg = "green" }
-- NoicePopupmenuBorder = { guifg = "lime", guibg = "green" }
-- NoicePopupmenuMatch = { guifg = "lime", guibg = "green" }
-- NoicePopupmenuSelected = { guifg = "lime", guibg = "green" }
-- NoiceScrollbar = { guifg = "lime", guibg = "green" }
-- NoiceScrollbarThumb = { guifg = "lime", guibg = "green" }
-- NoiceSplit = { guifg = "lime", guibg = "green" }
-- NoiceSplitBorder = { guifg = "lime", guibg = "green" }
-- NoiceVirtualText = { guifg = "lime", guibg = "green" }
