
filetype on
set nocompatible              " be iMproved, required
syntax on
set encoding=utf8

"""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""

" change <leader> key from defaul \ to , (easier when using azerty kb)
" useful to work with with cscope or nerdcommenter plugin
let mapleader=","
set timeout timeoutlen=1500

" Show linenumbers
set number
set ruler

" Set Proper Tabs
set tabstop=2
set shiftwidth=2

" Enable highlighting of the current line
set cursorline

colorscheme seti
"colorscheme desert
"colorscheme industry
"colorscheme koehler

" Syntastic Configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"""""""""""""""""""""""""""""""""""""
" Mappings configurationn
"""""""""""""""""""""""""""""""""""""
map <C-b> :NERDTreeToggle<CR>
map <C-m> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""
" list of installed plugins (with pacman)
"""""""""""""""""""""""""""""""""""""
" vim-nerdtree (file explorer)
" vim-surround (tool to easily surround with quotes)
" vim-tagbar (display structure of a file)
" vim-syntastic (syntax check)
" vim-nerdcommenter (comment tool)
" vim-latexsuite (Latex edition tool)
" vim-molokai (colorscheme)
" vim-seti (colorscheme)
" vim-ale (linter)
"
"""""""""""""""""""""""""""""""""""""
" list of installed plugins (with vim built-in package installer)
"""""""""""""""""""""""""""""""""""""
" omnisharp ( .NET tool )
