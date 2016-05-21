set nocp bs=2 cb=unnamed 
set ts=4 sts=4 sw=4 et
set ruler nowrap showcmd showmode fdm=marker  number hlsearch
set autoindent cindent
syntax enable
colorscheme jellybeans

" for matching control statements 
set nocompatible
filetype plugin on
runtime macros/matchit.vim

" octave.vim
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END 

set undofile
set backupdir=/tmp/kiarash/.vim/backup/
set directory=/tmp/kiarash/.vim/swap/
set undodir=/tmp/kiarash/.vim/undo/

nnoremap k gk
nnoremap j gj
nnoremap <up> gk
nnoremap <down> gj

" Turn off navigation keys!
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>

if has('gui_running')
	set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
	set guioptions-=r  "remove right-hand scroll bar
	set guioptions-=L  "remove left-hand scroll bar
	set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 12
endif

set cursorline

" airline plugin 
set laststatus=2
set noshowmode
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

