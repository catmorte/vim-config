call plug#begin('!/.vim/plugged')
Plug 'frazrepo/vim-rainbow'
Plug 'chun-yang/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
call plug#end()

let g:gitgutter_git_executable = 'C:\Program Files\Git\bin\git.exe'
let g:rainbow_active = 1
set laststatus=2
set ts=2
set sts=2
set sw=2
set fdm=indent
colorscheme desert
colorscheme monokai
set list
syntax on
source $VIMRUNTIME/vimrc_example.vim
let g:netrw_banner = 1
let g:netrw_liststyle = 1
let g:netrw_browse_split = 3
let g:netrw_altv = 1
let g:netrw_preview = 1
let g:netrw_winsize = 25
let g:netrw_sort_by="exten"
autocmd FileType netrw setl bufhidden=delete
set scrolloff=12
set nocompatible
set path+=**
set wildmenu
set clipboard=
set number relativenumber
set noscrollbind
set listchars=tab:→\ 
