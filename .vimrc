""
""  File							: .vimrc
""	 Path							: /home/dio/.vimrc
""  Created by					: Pierre "Za_warudo" SAILLARD
""  Login						: dio
""
""  Started						: [Sun 09 Oct 2016 15:04:10]
""  Last modification		: [Thu 27 Oct 2016 21:09:35]
""

filetype plugin indent on
syntax on

set showmatch
set shiftwidth=3
set tabstop=3
set autoindent
set smartindent
set nohlsearch
set nu
set nocp
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
set laststatus=2
set cursorline
set cursorcolumn
highlight CursorColumn guibg=DarkBlue ctermbg=DarkGrey

"GLOBAL VARIABLES

let g:userLastName = "SAILLARD"
let g:userFirstName = "Pierre"
let g:userNickName = "Za_warudo"
let g:userShell = "zsh"
let g:VIMTEMPLATES = $HOME."/.vim/templates/"
let g:MYVIM = $HOME."/.vim/"
let g:dictComments = {'pl': '##', 'PL': '##', 'py': '##', 'c': '//', 'cpp': '//', 'h': '//', 'hh': '//', 'vim': '""', 'sh': '##'}
let g:dictShebang = {'pl': 'perl', 'PL': 'perl', 'py': 'python3', 'sh': g:userShell}

"MAPPING
vmap <F2> :call Comment() <CR>
vmap <F3> :call Uncomment() <CR>

"HEADER CREATION
"note : c/cpp-style headers are default headers
autocmd BufNewFile * call InsertHeader()

"MAKEFILE CREATION
autocmd BufNewFile [Mm]akefile call CreateMakefile()

"UPDATE HEADER
autocmd BufWritePre * call UpdateHeader()


