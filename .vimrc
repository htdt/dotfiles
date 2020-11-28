set lazyredraw
set smartcase
set ignorecase
set undofile
set backup

set backupdir=~/.vim/tmp//
set directory=~/.vim/tmp//
set undodir=~/.vim/tmp//

filetype indent on
set encoding=utf-8
let python_highlight_all=1
syntax on
set number relativenumber
let mapleader=" "
set laststatus=2
set showcmd
set scrolloff=10
"set listchars=""
set tabstop=4
set shiftwidth=4
set splitbelow
set splitright
set smarttab
set expandtab
set termguicolors
set listchars=trail:-
set backspace=indent,eol,start
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark
packadd vim-material-theme
colorscheme material-theme

autocmd FileType python setlocal commentstring=#\ %s
autocmd FileType yaml setlocal commentstring=#\ %s
autocmd FileType typescript setlocal commentstring=//\ %s

autocmd FileType javascript setlocal tabstop=2 shiftwidth=2
autocmd FileType typescript setlocal tabstop=2 shiftwidth=2
autocmd FileType html setlocal tabstop=2 shiftwidth=2
autocmd FileType json setlocal tabstop=2 shiftwidth=2

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

set hlsearch
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'deus'

autocmd BufWritePost * GitGutter
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap <Leader>h <Plug>(GitGutterPreviewHunk)
nmap <Leader>u <Plug>(GitGutterUndoHunk)

nmap <S-Tab> :bprevious<CR>
nmap <Tab> :bnext<CR>
nmap <Leader><Tab> <C-W><C-W>
nmap <Leader>b :b#<CR>
nmap <Leader>1 :b1<CR>
nmap <Leader>2 :b2<CR>
nmap <Leader>3 :b3<CR>
nmap <Leader>4 :b4<CR>
nmap <Leader>5 :b5<CR>
nmap <Leader>6 :b6<CR>
nmap <Leader>7 :b7<CR>
nmap <Leader>8 :b8<CR>
nmap <Leader>9 :b9<CR>

map <c-d> :q<CR>
map <Leader>t :UndotreeToggle<CR>
"map <Leader>x :bd<CR>
map <Leader>z :pclose<CR>
map <Leader>x :bp\|bd #<CR>
map <Leader><Leader> :write<CR>
map <Leader>d :Explore<CR>
map <Leader>e :edit 
map <Leader>r :reg<CR>
vnoremap p "_dP
nnoremap <leader>c *``cgn
map [[ gg
map ]] G

" moving lines
nnoremap <c-j> :m .+1<CR>== 
nnoremap <c-k> :m .-2<CR>== 
inoremap <c-j> <Esc>:m .+1<CR>==gi 
inoremap <c-k> <Esc>:m .-2<CR>==gi 
vnoremap <c-j> :m '>+1<CR>gv=gv 
vnoremap <c-k> :m '<-2<CR>gv=gv

if executable('rg') 
	set grepprg=rg\ --vimgrep\ --hidden
endif

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

source ~/.vim/coc.vim
source ~/.vim/ab.vim
