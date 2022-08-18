" vim-plug plugins
call plug#begin('~/.cache/nvim/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

Plug 'jpalardy/vim-slime'
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()

call plug#end()

noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$

