"----------------------------------------------------------------------------------------
" general» vars»
let &t_SI="\<Esc>[5 q" " Cursor» blink pipe on Insert
let &t_SR="\<Esc>[3 q" " Cursor» blink underline on Replace
let &t_EI="\<Esc>[2 q" " Cursor> restore on exit modes

"-------------------------------------------------------------------------- auto-execution

" Make NerdTree close when no other buffer exists
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Show ExtraWhitespace
" NOTE: This might be causing a slowdown when in insert mode
autocmd VimEnter,Colorscheme,BufWinEnter * highlight ExtraWhitespace  guibg=#ff0000 ctermbg=1

" ExtraWhiteSpace Matching
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/        " Highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/ " Disable highlight on insert
autocmd InsertLeave * match ExtraWhitespace /\s\+$/        " …but reenable it afterwards
autocmd BufWinLeave * call clearmatches()                  " Apply matching to new buffers

"                                                                       :PLUGIN-SETTINGS
"----------------------------------------------------------------------------------------

" plugin» ctrlp» Make the plugin gitignore-aware
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_follow_symlinks=1 "  Follow symlinks, but avoid recursion

"                                                                                    :tern
" plugin» lightline»
let g:lightline = {
\   'colorscheme': 'gruvbox',
\   'active': {
\       'left': [
\           ['mode','paste'],
\           ['fugitive'],
\           ['readonly', 'filename']
\        ],
\       'right': [
\           ['filetype'],
\           ['fileformat','fileencoding']
\       ]
\   },
\   'statusline': {},
\   'tabline':{
\       'left':[
\           ['bufferline']
\       ],
\       'right':[
\           ['obsession', 'cwd', 'bufnr'],
\       ]
\   },
\   'component': {
\       'readonly': '%{&readonly?"":""}',
\       'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
\       'fugitive': '%{exists("*fugitive#head")?" ".fugitive#head():""}',
\       'obsession': '%{ObsessionStatus()}',
\       'cwd': '%{fnamemodify(getcwd(), ":t")}',
\       'bufnr': '%{bufnr("")}'
\   },
\   'component_expand':{
\       'bufferline' : 'LightlineBufferline',
\   },
\   'component_function':{
\       'filename': 'LightlineFilename'
\   },
\   'component_visible_condition': {
\       'readonly': '(&filetype!="help"&& &readonly)',
\       'modified': '(&filetype!="help"&& (&modified  || !&modifiable))',
\       'fugitive': '(exists("*fugitive#head") && "" != fugitive#head())'
\   },
\   'separator'    : { 'left' : '', 'right' : '' },
\   'subseparator' : { 'left' : '', 'right' : '' }
\}

function! LightlineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineFilename()
  let fname = expand('%F')
  return
  \ ('' != LightlineModified() ? LightlineModified() : '') .
  \ ('' != fname ? fname : '[No Name]')
endfunction

function! LightlineBufferline()
  call bufferline#refresh_status()
  return [
  \ g:bufferline_status_info.before,
  \ g:bufferline_status_info.after
  \]
endfunction

"------------------------------------------------------------------------------- :FOLDING

"                                                                                :MAPPING
"----------------------------------------------------------------------------------------

" Ignore this keymappings
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" make less difficult to type ] or [ by ramapping them to > and > respectively
" This is specially important for unimpaired
nmap <Left> [
omap <Left> [
xmap <Left> [
nmap <Right> ]
omap <Right> ]
xmap <Right> ]

" mapping» all»
map <Leader><Up> :resize +1<CR>|                          " window» resize up
map <Leader><Down> :resize -1 <CR>|                       " window» resize down
" mapping» all» movement»
map <Leader>mm <Plug>(easymotion-overwin-f)|               " using a char
map <Leader>mc <Plug>(easymotion-overwin-f2)|              " using 2 chars
map <Leader>mw <Plug>(easymotion-overwin-w)|               " using a word
map <Leader>ml <Plug>(easymotion-overwin-line)|            " using a line

" mapping» visual»
vnoremap <Leader>t :Tabularize /\v/<left>|                " Tabularize regex

" mapping» insert»
inoremap <C-a> <Esc>
imap <expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>"

" mapping» normal»
nmap Q q|                                                 " Avoid unintentional exMode
noremap Y y$                                              " Yank to the end of the line
nnoremap <CR> @@|                                         " repeat las macro
nnoremap <Leader>w :update<CR>
nnoremap <Leader>% :source $MYVIMRC<CR>|                  " reload vimrc settings
nnoremap <Leader>y :call WindowSwap#MarkWindowSwap()<CR>| " window» yank (for swap)
nnoremap <Leader>p :call WindowSwap#DoWindowSwap()<CR>|   " window» paste (swap)
nnoremap <Leader>h <C-w>h|                                " window» move to pane left
nnoremap <Leader>j <C-w>j|                                " window» move to pane below
nnoremap <Leader>k <C-w>k|                                " window» move to pane above
nnoremap <Leader>l <C-w>l|                                " window» move to pane right
nnoremap <Leader>\| :vnew<CR>|                            " window» new vert. split
nnoremap <Leader>- :new<CR>|                              " window» new ho. split
nnoremap <Leader><Left> :vertical resize +1<CR>|          " window» resize left
nnoremap <Leader><Right> :vertical resize -1<CR>|         " window» resize right
" mapping» normal» sets»
nnoremap <Leader>si :set tabstop=4 shiftwidth=4 expandtab<bar>retab<CR>|
" mapping» normal» buffers»
nnoremap <Leader>bi :ls!<CR>|                              " Active buffers
nnoremap <Leader>bd :bufdo bd<CR>                          " Remove all buffers
" mapping» normal» toggle»
nnoremap <Leader>ti :set list!<CR>|                        " Invisible chars
nnoremap <Leader>tn :NERDTreeToggle<CR>|                   " Nerdtree
nnoremap <Leader>tu :UndotreeToggle<CR>|                   " Undotree
" mapping» normal» search»
nnoremap / /\v|                                            " search magically
cnoremap %s %s/\v|                                         " replace magically
nnoremap // :%s/\v                                         " replace shortcut
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>|         " Clear search highlights
nnoremap <silent> <Esc><Esc><Esc> :/^❌ 💩 /<CR>|            " Forget current search
nnoremap <Leader>/ :Ack!<Space>|                           " search text in project
" mapping» normal» motion»
nnoremap <Leader>mn :GitGutterNextHunk<CR>|                " Git» hunk Next
nnoremap <Leader>mp :GitGutterPrevHunk<CR>|                " Git» hunk Prev
" mapping» normal» motion» filetype-specific»
autocmd Filetype javascript nnoremap <Leader>md :TernDef<CR>| " Move to definition
" mapping» normal» git»
nnoremap <Leader>g+ :GitGutterStageHunk<CR>|               " Git» hunk Stage
nnoremap <Leader>g- :GitGutterUndoHunk<CR>|                " Git» hunk Revert
nnoremap <Leader>gC :Gcommit --no-verify<CR>|              " Git» Commit without hooks
nnoremap <Leader>gc :Gcommit<CR>|                          " Git» Commit
nnoremap <Leader>gs :Gstatus<CR>|                          " Git» Status
nnoremap <Leader>gw :Gwrite<CR>|                           " Git» Write (add|checkout)
nnoremap <Leader>gr :Gread<CR>|                            " Git» Read (checkout|add)
nnoremap <Leader>gd :Gdiff<CR>|                            " Git» Diff
nnoremap <Leader>gp :Gpush<CR>|                            " Git» Push
" mapping» normal» tags»
nnoremap <Leader>T :GutentagsUpdate<CR>|                   " Reload Tags
" mapping» normal» vim»
nnoremap <Leader>vcd :NERDTreeFind<CR>:bd<CR>| " set the current directory as current
nnoremap <Leader>vs :CtrlPObsession<CR>|       " open session switcher
nnoremap <silent> <Leader>vr :silent !osascript -e "tell application \"Google Chrome\" to reload active tab of window 1"<CR>

nnoremap <Leader>vt :new<CR>:terminal<CR>|            " open terminal in a split.
tnoremap <C-a> <C-\><C-n>
tnoremap <silent> <Esc> <C-\><C-n>:bd!<CR>|           " Exit the terminal easily

