" ----------------------------------------------------------------------------
" Basic Settings
" ----------------------------------------------------------------------------

" Ensure backup directory exists
let s:vim_tmp_dir = expand('~/.vim/tmp')
if !isdirectory(s:vim_tmp_dir)
  call mkdir(s:vim_tmp_dir, 'p')
endif

set lazyredraw                          " Don't redraw screen during macros (faster)
set smartcase                           " Case-sensitive search if query contains uppercase
set ignorecase                          " Case-insensitive search by default
set undofile                            " Persistent undo across sessions
set backup                              " Create backup files before overwriting
set backupdir=~/.vim/tmp//
set directory=~/.vim/tmp//
set undodir=~/.vim/tmp//
filetype indent on                      " Enable filetype-specific indentation
set encoding=utf-8                      " Use UTF-8 encoding
syntax on                               " Enable syntax highlighting
set number relativenumber               " Show absolute line number on current line, relative elsewhere
let mapleader=" "                       " Set spacebar as leader key
set laststatus=2                        " Always show status line
set showcmd                             " Show incomplete commands in bottom right
set scrolloff=10                        " Keep 10 lines visible above/below cursor
set tabstop=4                           " Tab character displays as 4 spaces
set shiftwidth=4                        " Indent with 4 spaces
set splitbelow                          " Horizontal splits open below current window
set splitright                          " Vertical splits open right of current window
set smarttab                            " Insert tabs according to shiftwidth at line start
set expandtab                           " Convert tabs to spaces
set termguicolors                       " Enable 24-bit RGB colors in terminal
set listchars=trail:-                   " Show trailing whitespace as dashes
set backspace=indent,eol,start          " Allow backspace over everything in insert mode
set wildmenu                            " Enhanced command-line completion
set cursorline                          " Highlight current line
set showmatch                           " Briefly jump to matching bracket
set guifont=FiraCode\ Nerd\ Font\ 12
set clipboard=unnamedplus               " Use system clipboard for all operations
set hlsearch                            " Highlight all search matches
set incsearch                           " Show search matches as you type
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
" Ctrl-L clears search highlighting

" Use ripgrep for :grep if available
if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
endif

" for fzf :Files (Space-D)
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --no-ignore '
  \ . '--glob "!.git" '
  \ . '--glob "!__pycache__" '
  \ . '--glob "!.pytest_cache" '
  \ . '--glob "!*.pyc" '
  \ . '--glob "!node_modules"'

" Hide GUI elements in gvim
if has('gui_running')
    set guioptions-=m                   " Remove menu bar
    set guioptions-=T                   " Remove toolbar
    set guioptions-=r                   " Remove right scrollbar
    set guioptions-=L                   " Remove left scrollbar
endif

" ----------------------------------------------------------------------------
" Plugin Manager (vim-plug)
" ----------------------------------------------------------------------------
" Auto-install vim-plug if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')
" Color scheme plugins
Plug 'patstockwell/vim-monokai-tasty'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim', { 'as': 'nord' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'altercation/vim-colors-solarized'
Plug 'ghifarit53/tokyonight-vim'
Plug 'rose-pine/vim'

Plug 'vim-airline/vim-airline'          " Enhanced status line
Plug 'vim-airline/vim-airline-themes'   " Themes for airline status line

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " Fuzzy finder integration
Plug 'junegunn/fzf.vim'                 " Vim commands for fzf (:Rg, :Files, etc)
Plug 'airblade/vim-gitgutter'           " Shows git diff in sign column (left gutter)
Plug 'tpope/vim-fugitive'               " Git integration (:Git, :Gblame, :Gdiff, etc)
Plug 'tpope/vim-commentary'             " Comment toggling with gcc
Plug 'mbbill/undotree'                  " Visual undo history tree (<Leader>t)
Plug 'kshenoy/vim-signature'            " Show marks (bookmarks) in sign column
Plug 'vim-python/python-syntax'         " Enhanced Python syntax highlighting
Plug 'leafgarland/typescript-vim'       " TypeScript syntax highlighting
call plug#end()

" ----------------------------------------------------------------------------
" Color Scheme
" ----------------------------------------------------------------------------
set background=dark
colorscheme rosepine_moon
let g:airline_theme='base16'

" ----------------------------------------------------------------------------
" Airline Configuration
" ----------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1        " Show buffer tabs at top
let g:airline#extensions#tabline#buffer_nr_show = 1 " Show buffer numbers in tabs
let g:airline_powerline_fonts = 1                    " Use powerline symbols in status line

" ----------------------------------------------------------------------------
" GitGutter Configuration
" ----------------------------------------------------------------------------
autocmd BufWritePost * GitGutter
" Update git diff signs after every save
nmap ]h <Plug>(GitGutterNextHunk)
" Jump to next git change
nmap [h <Plug>(GitGutterPrevHunk)
" Jump to previous git change
nmap <Leader>h <Plug>(GitGutterPreviewHunk)
" Preview git hunk in popup
nmap <Leader>u <Plug>(GitGutterUndoHunk)
" Undo git hunk under cursor

" ----------------------------------------------------------------------------
" FileType-specific Settings
" ----------------------------------------------------------------------------
autocmd FileType python setlocal commentstring=#\ %s
autocmd FileType yaml setlocal commentstring=#\ %s
autocmd FileType typescript setlocal commentstring=//\ %s

autocmd FileType javascript setlocal tabstop=2 shiftwidth=2
autocmd FileType typescript setlocal tabstop=2 shiftwidth=2
autocmd FileType html setlocal tabstop=2 shiftwidth=2
autocmd FileType json setlocal tabstop=2 shiftwidth=2

" ----------------------------------------------------------------------------
" Key Mappings
" ----------------------------------------------------------------------------

" Buffer navigation
nmap <C-PageUp> :bprevious<CR>
" Previous buffer with Ctrl-PageUp
nmap <C-PageDown> :bnext<CR>
" Next buffer with Ctrl-PageDown
nmap <Leader><Tab> <C-W><C-W>
" Cycle through windows with Space-Tab
nmap <Leader>b :b#<CR>
" Toggle to last buffer with Space-b
nmap <Leader>1 :b1<CR>
" Jump to buffer 1-9 with Space-[1-9]
nmap <Leader>2 :b2<CR>
nmap <Leader>3 :b3<CR>
nmap <Leader>4 :b4<CR>
nmap <Leader>5 :b5<CR>
nmap <Leader>6 :b6<CR>
nmap <Leader>7 :b7<CR>
nmap <Leader>8 :b8<CR>
nmap <Leader>9 :b9<CR>

" Window and buffer management
map <c-d> :q<CR>
" Quit window with Ctrl-d
map <Leader>t :UndotreeToggle<CR>
" Toggle undo tree with Space-t
map <Leader>z :pclose<CR>
" Close preview window with Space-z
map <Leader>x :bp\|bd #<CR>
" Close buffer without closing window with Space-x
map <Leader><Leader> :write<CR>
" Save file with Space-Space
map <Leader>d :Files<CR>
" Fuzzy find files with Space-d
map <Leader>e :Buffers<CR>
" Fuzzy find open buffers with Space-e
map <Leader>r :Rg<CR>
" Ripgrep search across project with Space-r
map <Leader>/ :BLines<CR>
" Fuzzy search lines in current buffer
map <Leader>g :GFiles?<CR>
" Show git modified files (staged/unstaged)
map <Leader>m :Marks<CR>
" Fuzzy find marks

xnoremap p "_dP
" Paste in visual mode without yanking replaced text

nnoremap <leader>c *``cgn
" Search word under cursor and prepare to change all with dot

" Moving lines up and down
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
inoremap <c-j> <Esc>:m .+1<CR>==gi
inoremap <c-k> <Esc>:m .-2<CR>==gi
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

" Disable arrow keys (hard mode)
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>
