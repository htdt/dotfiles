set lazyredraw
set smartcase
set ignorecase
set undofile

filetype indent on
set encoding=utf-8
let python_highlight_all=1
syntax on
set number relativenumber
let mapleader=" "
set laststatus=2
set showcmd
set scrolloff=10
set listchars=""
set tabstop=4
set shiftwidth=4
set splitbelow
set splitright

packadd iceberg.vim
set background=dark
colorscheme iceberg

let g:UltiSnipsExpandTrigger = "<Nop>"

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
let g:airline_theme = 'iceberg'

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
xnoremap \ I# <ESC>
vnoremap p "_dP

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
