packadd iceberg.vim

set encoding=utf-8
let python_highlight_all=1
syntax on
set background=dark
colorscheme iceberg
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

let g:UltiSnipsExpandTrigger = "<Nop>"

" set hlsearch
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
" map *  <Plug>(incsearch-nohl-*)
" map #  <Plug>(incsearch-nohl-#)
" map g* <Plug>(incsearch-nohl-g*)
" map g# <Plug>(incsearch-nohl-g#)


let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'iceberg'

autocmd BufWritePost * GitGutter
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap <Leader>h <Plug>(GitGutterPreviewHunk)
nmap <Leader>u <Plug>(GitGutterUndoHunk)

map <Leader>j <C-W><C-W>
map <Leader>, :bprevious<CR>
map <Leader>. :bnext<CR>
map <Leader>1 :b1<CR>
map <Leader>2 :b2<CR>
map <Leader>3 :b3<CR>
map <Leader>4 :b4<CR>
map <Leader>5 :b5<CR>
map <Leader>6 :b6<CR>
map <Leader>7 :b7<CR>
map <Leader>8 :b8<CR>
map <Leader>9 :b9<CR>

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
