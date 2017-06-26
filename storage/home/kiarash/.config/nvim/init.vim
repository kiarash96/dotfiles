set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set number relativenumber
set cursorline
set incsearch hlsearch
set laststatus=0 showmode ruler noshowcmd "Disable statusbar
set hidden " Enable switching buffers when there are unsaved changes
set splitright splitbelow

"set clipboard+=unnamedplus " Sync X clipboard with unnamed register

set backup undofile
set backupdir=/tmp/nvim/backup
set directory=/tmp/nvim/swap
set undodir=/tmp/nvim/undo

" Create directories if they do not exist
silent !mkdir -p /tmp/nvim/backup /tmp/nvim/swap /tmp/nvim/undo

" Better navigation in wrapped lines
nnoremap k gk
nnoremap j gj
nnoremap <up> gk
nnoremap <down> gj
set textwidth=80 wrapmargin=80

" Set leader
let mapleader = "\\"

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

" Different file types local settings
autocmd BufRead,BufNewFile *.htm,*.html,*.xhtml,*.php,*.css,*.scss setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd BufRead,BufNewFile *.tex setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Start vim-plug
call plug#begin('~/.cache/nvim/plugged')

Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'

Plug 'ap/vim-buftabline'

Plug 'kelwin/vim-smali'

call plug#end()

" Gruvbox colorscheme
set termguicolors
set background=dark
let g:gruvbox_invert_selection=0
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='medium'
colorscheme gruvbox

