local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

vim.o.foldenable = true
vim.o.foldlevel = 99
-- vim.o.foldtext = " "
vim.opt.foldcolumn = "1"
vim.opt.fillchars:append({fold = " "})
vim.o.foldmethod = "manual" --"expr"
-- vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

function _G.custom_fold_text()
    local lines = vim.v.foldend - vim.v.foldstart + 1

    local line_pre = " ↕ "
    local line_txt = vim.fn.getline(vim.v.foldstart) .. " "
    local line_pos = " [" .. lines .. "]"

    local width = vim.o.textwidth > 0 and vim.o.textwidth or vim.fn.winwidth(0)
    local len = width - #line_pre - #line_txt - #line_pos

    len = math.max(len, 0)

    local fill = string.rep(vim.v.folddashes, len)  -- or use vim.v.folddashes if you prefer

    return line_pre .. line_txt .. fill .. line_pos
end

vim.opt.foldtext = 'v:lua.custom_fold_text()'
vim.opt.foldtext = 'v:lua.custom_fold_text()'

local view_group = augroup("auto_view", { clear = true })

-- saves/loads folding

autocmd({ "BufWinLeave", "BufWritePost", "WinLeave" }, {
  desc = "Save view with mkview for real files",
  group = view_group,
  callback = function(args)
    if vim.b[args.buf].view_activated then vim.cmd.mkview { mods = { emsg_silent = true } } end
  end,
})

autocmd("BufWinEnter", {
  desc = "Try to load file view if available and enable view saving for real files",
  group = view_group,
  callback = function(args)
    if not vim.b[args.buf].view_activated then
      local filetype = vim.api.nvim_get_option_value("filetype", { buf = args.buf })
      local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
      local ignore_filetypes = { "gitcommit", "gitrebase", "svg", "hgcommit" }
      if buftype == "" and filetype and filetype ~= "" and not vim.tbl_contains(ignore_filetypes, filetype) then
        vim.b[args.buf].view_activated = true
        vim.cmd.loadview { mods = { emsg_silent = true } }
      end
    end
  end,
})


return {}
