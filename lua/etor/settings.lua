-- behaviour» 
--
vim.o.title = true  -- Vim will set the terminal title
vim.o.autoread = true  -- Detect when a file has changed
vim.o.hidden = true  -- Don"t unload buffer when closed
vim.o.splitbelow = true  -- Open splits below instead of above
vim.o.splitright = true  -- Open slits right instead of above
vim.o.diffopt = "vertical,filler"  -- Define window behaviour for diffs (horizontal split)
vim.o.clipboard = "unnamed"  -- system-wide clipboard supprt
vim.o.mouse = "a" -- Enable mouse support

-- behaviour»swap-and-backups» 
-- Instead of using swap and backups, we'll use undotree, see settings there
--
vim.o.backup = false  -- Backup file creation
vim.bo.swapfile = false  -- Swapfile creation
vim.bo.undofile = false  -- Undo management
--vim.o.undodir = os.getenv("HOME") .. "/.config/nvim/cache/undo/"  -- Set dir for undos
--vim.o.directory = "$HOME/.config/nvim/cache/swap/"  -- cache» Set dir for swapfiles
--vim.o.backupdir = "$HOME/.config/nvim/cache/back/"  -- cache» Set dir for backups

-- ui» 
--
vim.o.termguicolors = true -- we like good colors
vim.wo.cursorline = true  -- Show the current line
vim.o.synmaxcol = 110  -- render syntax only for first n characters in a line
vim.o.showtabline = 2  -- Whether to show the tabline (upper side filename)
vim.o.laststatus = 2  -- draws a status bar on the bottom

-- ui»cmdline
--
vim.o.wildmode = "list:longest"  -- autocomplete until longest word is filled
vim.o.wildmenu = true  -- Enables extended features for completion
vim.o.showcmd = true  -- Shows the last command entered
vim.o.history = 9999  -- buffer» Control the history length

-- ui»gutter» 
--
vim.o.number = true -- Line numbers
vim.o.relativenumber = true -- relative line numbers
vim.o.updatetime = 50  -- lower the time it takes to update gitgutter
vim.wo.numberwidth = 4  -- Sets the width of the line numbering column
vim.o.scrolloff = 9  -- Always maintain n lines of context below

-- buffer-and-content» 
--
vim.o.spell = false  -- spell checking
vim.wo.wrap = false  -- Line wrapping
vim.wo.cursorcolumn = true  -- Whether to show the current column
vim.wo.colorcolumn = "90"  -- draws a bar on given line
vim.bo.textwidth = 100  -- maximum length of a line

-- buffer-and-content»indenting» 
--
vim.o.smarttab = true  -- tab respects "tabstop" "shiftwidth" and "softtabstop"
vim.o.shiftround = true  -- round indent to a multiple of "shiftwidth"
vim.bo.expandtab = true  -- Inserts spaces rather than tabs
vim.bo.autoindent = true  -- Enable auto indentation
vim.bo.smartindent = true  -- Determine indentation level automatically
vim.bo.tabstop = 4  -- Set tab length
vim.bo.softtabstop = 0  --  Force softtabbing
vim.bo.shiftwidth = 4  -- How many cols to indent on reindent
vim.o.backspace = "indent,eol,start"  -- Make backspace behave the way you expect

-- buffer-and-content»highlight-and-search» 
--
vim.o.incsearch = true  -- Search as you type
vim.o.hlsearch = true  -- Highlight search results
vim.o.ignorecase = true  -- Ignore case when searching…
vim.o.smartcase = true  -- ...but not when an uppercase letter is present
vim.o.gdefault = true  -- Assume always /g on replacements
vim.o.magic = true  -- Enables regex magic, no need for backslashes in some cases.
vim.o.grepprg = "ag"  -- Use the_silver_searcher insteand of grep
vim.o.showmatch = true  -- show match on parenthesis and curly braces
vim.o.listchars = "tab:▸ ,space:·,eol:¬,trail:·,nbsp:×,extends:❯,precedes:❮"  -- Invisibles
 
