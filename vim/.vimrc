""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" install vim-plug if not found
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')       " Specify a directory for plugins

Plug 'nanotech/jellybeans.vim'          " colorscheme
Plug 'mhinz/vim-signify'                " vcs diff indicators
Plug 'christoomey/vim-tmux-navigator'   " navigation for vim/tmux split/panes
Plug 'tpope/vim-sleuth'                 " detects existing indentation
Plug 'tpope/vim-commentary'             " mappings for comments
Plug 'tpope/vim-surround'               " mappings for quotes, parens, etc
Plug 'Raimondi/delimitMate'             " auto-complete quotes, parens, etc
Plug 'vim-syntastic/syntastic'          " syntax checker
" language packs loaded on-demand
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }


call plug#end()                     " Initialize plugin system

filetype plugin on
runtime macros/matchit.vim          " extended functionality of '%' command

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme jellybeans
syntax on                       " syntax highlighting
set nocompatible            	" disable vi compatible mode
set history=200                 " command-line history
set showcmd                     " show command in bottom bar
set wildmenu wildmode=full      " command-line tab completion
set laststatus=2                " always show statusline
set splitbelow splitright       " direction in which new window splits opens
set incsearch                   " show search matches as you type
set ignorecase smartcase        " case-insensitive search when all lowercase
" wait time for keystroke sequence interpretation
set timeout timeoutlen=1000 ttimeoutlen=0
set autoread                    " reload file when changed outside of vim
set spell spelllang=en_us       " spell-checking

"
" Swap file directory
"
if !isdirectory($HOME."/.vim/tmp")
    call mkdir($HOME.'/.vim/tmp', 'p')
endif
set directory=$HOME/.vim/tmp//

"
" Indentation
"
filetype indent on
" default indent is 4 spaces 
set tabstop=4		" number of spaces tab count for visually
set softtabstop=4	" number of spaces tab count for when editing 
set shiftwidth=4    " used for autoindent
set autoindent      " copy indent for current line when staring a new line
set smarttab        " handles tabs in front of line according to indent options
set expandtab		" tabs are spaces
" indent preferences per filetype
autocmd FileType javascript setlocal ts=2 sw=2 sts=2 expandtab
autocmd FileType html setlocal ts=2 sw=2 sts=2 expandtab
autocmd FileType ruby setlocal ts=2 sw=2 sts=2 expandtab

"
" Line numbers
"
set number relativenumber       " hybrid line numbers
" toggle between absolute and hybrid line numbers on enter/leaving insert mode
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"
" Cursorline
"
set cursorline
" only show cursorline in current window
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=','

" Quick close window
map <silent> <leader>q :quit<CR>
map <silent> <leader>x :quit!<CR>

" Quick save
map <silent> <leader>w :write<CR>

" Turn off highlighting of last search pattern
nnoremap <CR> :nohlsearch<CR>

" " Split Navigation [now handled by vim-tmux-navigator]
" map <C-h> <C-w>h
" map <C-j> <C-w>j
" map <C-k> <C-w>k
" map <C-l> <C-w>l

" Buffer list traversal
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Expansion of active file directory in cmdline
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
" mappings to utilizing expansion
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
