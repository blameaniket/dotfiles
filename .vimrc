set nu
set rnu

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set smartindent
set autoindent

set noswapfile
set nobackup

set nowrap


set signcolumn=yes

" Set color column at 80 characters
set colorcolumn=80

" netrw settings
let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 25

set scrolloff=15

set ttimeoutlen=10



set noswapfile
set nobackup

set undofile
" set undodir=$HOME/.vim/undodir


" Set leader key
let mapleader = " "

" Open netrw explorer
nnoremap <leader>e :Ex<CR>

" Move selected lines down/up in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Keep cursor centered when scrolling
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Keep search matches centered
nnoremap n nzzzv
nnoremap N Nzzzv

call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'lurst/austere.vim'

" Plug 'mbbill/undotree'

call plug#end()



colorscheme austere

hi ColorColumn guibg=#222222


nnoremap <C-p> :FZF<CR>
