set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set number relativenumber
set cursorline
set incsearch hlsearch
set laststatus=0 showmode ruler noshowcmd "Disable statusbar
set hidden " Enable switching buffers when there are unsaved changes
set splitright splitbelow
set mouse=a

"set clipboard+=unnamedplus " Sync X clipboard with unnamed register

set backup undofile

let g:base_data_dir = expand($TMPDIR) . "/nvim"

let &backupdir = g:base_data_dir . "/backup"
let &directory = g:base_data_dir . "/swap"
let &undodir = g:base_data_dir . "/undo"

execute "silent !mkdir -p " . &backupdir . " " . &directory . " " . &undodir

" Create directories if they do not exist
"silent !mkdir -p "$TMPDIR/nvim/backup" "$TMPDIR/nvim/swap" "$TMPDIR/nvim/undo"

" Better navigation in wrapped lines
nnoremap k gk
nnoremap j gj
nnoremap <up> gk
nnoremap <down> gj

" Set leader
let mapleader = "\\"

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

" Different file types local settings
" autocmd BufRead,BufNewFile *.htm,*.html,*.xhtml,*.php,*.css,*.scss setlocal shiftwidth=2 tabstop=2 softtabstop=2
" autocmd BufRead,BufNewFile *.tex setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Start vim-plug
call plug#begin('~/.cache/nvim/plugged')

Plug 'nanotech/jellybeans.vim'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'

Plug 'ap/vim-buftabline'

" Syntax addons
" Plug 'kelwin/vim-smali'
Plug 'blankname/vim-fish'


call plug#end()

set termguicolors
set background=dark

" Gruvbox colorscheme
let g:gruvbox_invert_selection=0
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='medium'
colorscheme gruvbox

colorscheme molokai
