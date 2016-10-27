""
""  File							: misc.vim
""	 Path							: /home/dio/.vim/plugin/misc.vim
""  Created by					: Pierre "Za_warudo" SAILLARD
""  Login						: dio
""
""  Started						: [Thu 27 Oct 2016 22:43:01]
""  Last modification		: [Fri 28 Oct 2016 00:10:49]
""

function FileLineNum(filePath)
	let s:nbLine = str2nr(system("wc -l ".a:filePath))
	return s:nbLine
endfunction
