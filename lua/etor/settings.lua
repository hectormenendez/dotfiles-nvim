local HOME = os.getenv("HOME");
local SHARE = HOME .. "/.local/share/nvim";

------------------------------------------------------------------------------ behaviour:

vim.opt.title = true -- Vim will set the terminal title
vim.opt.autoread = true -- Detect when a file has changed
vim.opt.hidden = true -- Don"t unload buffer when closed
vim.opt.splitbelow = true -- Open splits below instead of above
vim.opt.splitright = true -- Open slits right instead of above
vim.opt.diffopt = "vertical,filler" -- Define window behaviour for diffs (horizontal split)
vim.opt.clipboard = "unnamed" -- system-wide clipboard supprt
vim.opt.mouse = "a" -- Enable mouse support

vim.opt.backup = false -- Backup file creation
vim.opt.swapfile = false -- Swapfile creation
vim.opt.undofile = true -- Undo management
vim.opt.undodir = SHARE .. "/undo/"
vim.opt.directory = SHARE .. "/swap/"
vim.opt.backupdir = HOME .. "/backup/"

------------------------------------------------------------------------------------- ui:

vim.opt.termguicolors = true -- we like good colors
vim.opt.cursorline = true -- Show the current line
--vim.opt.synmaxcol = 110  -- render syntax only for first n characters in a line
vim.opt.showtabline = 2 -- Whether to show the tabline (upper side filename)
vim.opt.laststatus = 2 -- draws a status bar on the bottom

---------------------------------------------------------------------------- ui: cmdline:

vim.opt.wildmode = "list:longest" -- autocomplete until longest word is filled
vim.opt.wildmenu = true -- Enables extended features for completion
vim.opt.showcmd = true -- Shows the last command entered
vim.opt.history = 9999 -- buffer» Control the history length

----------------------------------------------------------------------------- ui: gutter:

vim.opt.number = true -- Line numbers
vim.opt.relativenumber = true -- relative line numbers
vim.opt.updatetime = 50 -- lower the time it takes to update gitgutter
vim.opt.numberwidth = 4 -- Sets the width of the line numbering column
vim.opt.scrolloff = 9 -- Always maintain n lines of context below

--------------------------------------------------------------------- buffer-and-content:

vim.opt.spell = false -- spell checking
vim.opt.wrap = false -- Line wrapping
vim.opt.cursorcolumn = true -- Whether to show the current column
vim.opt.colorcolumn = "90" -- draws a bar on given line
vim.opt.textwidth = 90 -- maximum length of a line

---------------------------------------------------------- buffer-and-content: indenting:

vim.opt.smarttab = true -- tab respects "tabstop" "shiftwidth" and "softtabstop"
vim.opt.shiftround = true -- round indent to a multiple of "shiftwidth"
vim.opt.expandtab = true -- Inserts spaces rather than tabs
vim.opt.autoindent = true -- Enable auto indentation
vim.opt.smartindent = true -- Determine indentation level automatically
vim.opt.tabstop = 4 -- Set tab length
vim.opt.softtabstop = 4 --  Force softtabbing
vim.opt.shiftwidth = 4 -- How many cols to indent on reindent
vim.opt.backspace = "indent,eol,start" -- Make backspace behave the way you expect

----------------------------------------------- buffer-and-content: highlight-and-search:

vim.opt.incsearch = true -- Search as you type
vim.opt.hlsearch = true -- Highlight search results
vim.opt.ignorecase = true -- Ignore case when searching…
vim.opt.smartcase = true -- ...but not when an uppercase letter is present
vim.opt.gdefault = true -- Assume always /g on replacements
vim.opt.magic = true -- Enables regex magic, no need for backslashes in some cases.
vim.opt.grepprg = "ag" -- Use the_silver_searcher insteand of grep
vim.opt.showmatch = true -- show match on parenthesis and curly braces
vim.opt.listchars = "tab:▸ ,space:·,eol:¬,trail:·,nbsp:×,extends:❯,precedes:❮" -- Invisibles
