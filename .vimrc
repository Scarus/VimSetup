""
""  File							: .vimrc
""	 Path							: /home/dio/.vimrc
""  Created by					: Pierre "Za_warudo" SAILLARD
""  Login						: dio
""
""  Started						: [Sun 09 Oct 2016 15:04:10]
""  Last modification		: [Sun 09 Oct 2016 22:55:10]
""

filetype plugin indent on
syntax on

set showmatch
set shiftwidth=3
set tabstop=3
set autoindent
set smartindent
set hlsearch
set nu
set nocp
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
set laststatus=2
set cursorline
set cursorcolumn
highlight CursorColumn guibg=DarkBlue ctermbg=DarkGrey

let g:userLastName = "SAILLARD"
let g:userFirstName = "Pierre"
let g:userNickName = "Za_warudo"
let g:VIMTEMPLATES = $HOME."/.vim/templates/"
let g:MYVIM = $HOME."/.vim/"

"HEADER CREATION
"note : c/cpp-style headers are default headers
autocmd BufNewFile * call InsertHeader()

"MAKE.vimrc CREATION
autocmd BufNewFile [Mm]akefile call CreateMakefile()

"UPSun 09 Oct 2016 15:04:10 HEADER
autocmd BufWritePre * call UpdateHeader()

