set tabstop=6 softtabstop=4 shiftwidth=4 expandtab
set number relativenumber
set cursorline

set hidden " Enable switching buffers when there are unsaved changes
set splitright splitbelow

"set clipboard+=unnamedplus " Sync X clipboard with unnamed register

set undofile
set backupdir=/tmp/kiarash/.nvim/backup/
set directory=/tmp/kiarash/.nvim/swap/
set undodir=/tmp/kiarash/.nvim/undo/

" Better navigation in wrapped lines
nnoremap k gk
nnoremap j gj
nnoremap <up> gk
nnoremap <down> gj

" Set leader
let mapleader = "\\"

" Start vim-plug
call plug#begin('~/.cache/nvim/plugged')

" Plugins
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
"Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-rooter'
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'lervag/vimtex'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'qpkorr/vim-bufkill'

" vim-tmux-navigator neovim fix for ctrl+h
nnoremap <silent> <c-a> :TmuxNavigatePrevious<cr>
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" vim-bufkill
cabbrev bd <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'BD' : 'bdelete')<CR>

Plug 'ctrlpvim/ctrlp.vim'
" Ignore files in gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Clojure

Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
"Plug 'tpope/vim-salve'
Plug 'tpope/vim-fireplace', { 'tag' : '*' }
Plug 'guns/vim-clojure-highlight'

Plug 'kien/rainbow_parentheses.vim'
au BufEnter *.clj RainbowParenthesesToggle
au Syntax clojure RainbowParenthesesLoadRound
au Syntax clojure RainbowParenthesesLoadSquare
au Syntax clojure RainbowParenthesesLoadBraces

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" Syntax highlighting
Plug 'jvirtanen/vim-octave'
Plug 'lepture/vim-jinja'

" Code completion
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim'
let g:deoplete#enable_at_startup = 1
set completeopt-=preview

" Use Ctrl+Space for moving in menu
inoremap <silent><expr> <C-Space> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
imap <C-@> <C-Space>

" Completion engines
Plug 'zchee/deoplete-jedi'

"Plug 'artur-shaik/vim-javacomplete2'

" Colorschemes
Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
filetype plugin indent on

colorscheme jellybeans

" Airline configuration
set noshowmode
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Different file types local settings
autocmd BufRead,BufNewFile *.htm,*.html,*.xhtml,*.php,*.css,*.scss setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd BufRead,BufNewFile *.tex setlocal shiftwidth=2 tabstop=2 softtabstop=2

:set virtualedit=all
