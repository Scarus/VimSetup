""
""  File							: clean.vim
""	 Path							: /home/dio/.vim/plugin/clean.vim
""  Created by					: Pierre "Za_warudo" SAILLARD
""  Login						: dio
""
""  Started						: [Fri 14 Oct 2016 23:10:26]
""  Last modification		: [Tue 25 Oct 2016 22:40:54]
""

"indent the file and delete spaces and tab at the end of the lines.
function Cleanfile()
	let s:curpos = getcurpos()
	normal g=G
	%substitute/\s*$//ge
	call setpos('.', s:curpos)
endfunction
