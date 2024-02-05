" * file: ~/.vimrc
" ################################################################################
" ** notes
" ********************************************************************************
" based on: https://github.com/junegunn/vim-plug
"
"
" ********************************************************************************
" ** Plugins
" ********************************************************************************
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" syntastic
Plug 'scrooloose/syntastic'

" powerline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'

" color theme
Plug 'sickill/vim-monokai'

" supertab
" Plug 'ervandew/supertab'
Plug 'yggdroot/indentline'

" tabularize
Plug 'godlygeek/tabular'

" markup languages
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

call plug#end()


" ********************************************************************************
" ** vim settings
" ********************************************************************************
" *** color theme
" ==============================================================================
syntax enable
colorscheme monokai

" ==============================================================================
" *** basic settings
" ==============================================================================
set number
set nowrap
set paste

" ==============================================================================
" *** tabs/indentation
" ==============================================================================
" default tabwidth
set tabstop=4
set shiftwidth=4
set expandtab

" ==============================================================================
" *** filetype specific tabwidth
" ==============================================================================
autocmd Filetype css  setlocal tabstop=2 shiftwidth=2
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2
autocmd Filetype yml  setlocal tabstop=2 shiftwidth=2
autocmd Filetype py   setlocal tabstop=4 shiftwidth=4

" ==============================================================================
" *** indentation based on tab
" ==============================================================================
set listchars=tab:\|\ 
set list

" ==============================================================================
" *** yggdrot/indentline
" ==============================================================================
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2


" ==============================================================================
" *** remap keys: tab right/left
" ==============================================================================
nnoremap <Left> :tabprevious<CR>
nnoremap <Right> :tabnext<CR>


" ################################################################################
