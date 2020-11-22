
filetype on
set nocompatible              " be iMproved, required
syntax on
set encoding=utf8

"""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""

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
