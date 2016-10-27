""
""  File							: Comments.vim
""	 Path							: /home/dio/.vim/plugin/Comments.vim
""  Created by					: Pierre "Za_warudo" SAILLARD
""  Login						: dio
""
""  Started						: [Wed 26 Oct 2016 00:11:59]
""  Last modification		: [Thu 27 Oct 2016 20:57:39]
""

function Comment()
	let s:ext = expand('%:e')
	substitute/^/\=g:dictComments[s:ext]/
endfunction

function Uncomment()
	let s:ext = expand('%:e')
	execute "substitute/^".g:dictComments[s:ext]."//e"
endfunction
