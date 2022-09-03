call plug#begin('!/.vim/plugged')
Plug 'frazrepo/vim-rainbow'
Plug 'chun-yang/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'sirver/ultisnips'
Plug 'vim-scripts/ctrlp.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()
colorscheme dracula
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
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
nnoremap tn :tabnew<cr>
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
let g:python3_host_prog = 'C:\Users\Raman_Susla\AppData\Local\Programs\Python\Python38\python3.exe'
lua << EOF require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules", "\!\\.vim\\plugged"} } }
