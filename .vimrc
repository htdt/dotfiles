set nocompatible              " required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'haya14busa/incsearch.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dense-analysis/ale'
Plugin 'zxqfl/tabnine-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'kshenoy/vim-signature'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'vim-python/python-syntax'
Plugin 'thaerkh/vim-indentguides'
Plugin 'SirVer/ultisnips'

Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'haishanh/night-owl.vim'
Plugin 'morhetz/gruvbox'
Plugin 'nanotech/jellybeans.vim'
Plugin 'mhartington/oceanic-next'
call vundle#end()            " required
filetype plugin indent on    " required

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8
let python_highlight_all=1
syntax on
set background=dark
colorscheme gruvbox
set number relativenumber
let mapleader=" "
set laststatus=2
set showcmd
set scrolloff=10
set listchars=""


map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)


let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'deus'

let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'python': ['black']}
map <leader>g :ALEGoToDefinition<CR>
map <leader>f :ALEFix<CR>

autocmd BufWritePost * GitGutter
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap <Leader>h <Plug>(GitGutterPreviewHunk)
nmap <Leader>u <Plug>(GitGutterUndoHunk)

map <Leader>j :bprevious<CR>
map <Leader>k :bnext<CR>
map <Leader>1 :b1<CR>
map <Leader>2 :b2<CR>
map <Leader>3 :b3<CR>
map <Leader>4 :b4<CR>
map <Leader>5 :b5<CR>
map <Leader>x :bd<CR>
map <Leader>z :pclose<CR>
map <Leader><Leader> :write<CR>
map <Leader>d :Explore<CR>
map <Leader>e :edit 

let g:UltiSnipsExpandTrigger="<c-space>"

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
