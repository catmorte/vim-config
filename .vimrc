" let &runtimepath.= PATH with absolute prefixes to fix stratup vim outside of homedir
call plug#begin('!/.vim/plugged')
Plug 'chun-yang/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'sirver/ultisnips'
Plug 'vim-scripts/ctrlp.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'morhetz/gruvbox'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'mtdl9/vim-log-highlighting'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color'
call plug#end()
set laststatus=2
set ts=2
set sts=2
set sw=2
set fdm=indent
set list
syntax on
set mouse=a
let g:gruvbox_contrast_dark = "medium"
let g:fern#renderer = "nerdfont"
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1
let g:fern#disable_default_mappings = 1
noremap <Leader>d <cmd>:Fern . -drawer -reveal=% -toggle<cr>
augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END
:set shell=powershell
function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> M <Plug>(fern-action-rename)
  nmap <buffer> h <Plug>(fern-action-hidden:toggle)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> k <Plug>(fern-action-mark:toggle)
  nmap <buffer> b <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer><nowait> < <Plug>(fern-action-leave)
  nmap <buffer><nowait> > <Plug>(fern-action-enter)
endfunction
augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END
let g:netrw_banner = 1
let g:netrw_liststyle = 1
let g:netrw_browse_split = 3
let g:netrw_altv = 1
let g:netrw_preview = 1
let g:netrw_winsize = 25
let g:netrw_sort_by="exten"
" autocmd FileType netrw setl bufhidden=delete
set scrolloff=12
set nocompatible
set path+=**
set wildmenu
set clipboard=
set number relativenumber
set noscrollbind
set listchars=tab:???\ 
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_parameters = 1
set backupdir=~/vimtmp//,.
set directory=~/vimtmp//,.

autocmd FileType go nmap gc <Plug>(go-callers)
autocmd FileType go nmap gi :GoImplements<return>
autocmd FileType go nmap gd :GoDef<return>

:command! CopyBuffer let @+ = expand('%:p')
nnoremap tn :tabnew<cr>
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
nnoremap <esc> :noh<return><esc>
tnoremap <Esc> <C-\><C-n>
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nnoremap <leader>ff <cmd>:Telescope find_files find_command=rg,--no-ignore,--files prompt_prefix=???? layout_config={"prompt_position":"top"} hidden=true<cr>
nnoremap <leader>fg <cmd>:Telescope live_grep find_command=rg,--no-ignore prompt_prefix=???? layout_config={"prompt_position":"top"} hidden=true<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
let g:go_fmt_autosave = 0
colorscheme deep-space
" colorscheme dracula
highlight Normal ctermbg=none
highlight NonText ctermbg=none
let g:python3_host_prog = 'C:\Users\Raman_Susla\AppData\Local\Programs\Python\Python38\python3.exe'
lua << EOF require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules", "\!\\.vim\\plugged"}, pickers = { find_files = { hidden = true } }} }
