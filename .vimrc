call plug#begin('!/.vim/plugged')
Plug 'frazrepo/vim-rainbow'
Plug 'chun-yang/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
call plug#end()
colorscheme desert
let g:gitgutter_git_executable = 'C:\Program Files\Git\bin\git.exe'
let g:rainbow_active = 1
set laststatus=2
set ts=2
set sts=2
set sw=2
set fdm=indent
set list
syntax on
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

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
