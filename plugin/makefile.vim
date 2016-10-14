""
""  File							: makefile.vim
""	 Path							: /home/dio/.vim/plugin/makefile.vim
""  Created by					: Pierre "Za_warudo" SAILLARD
""  Login						: dio
""
""  Started						: [Sun 09 Oct 2016 15:05:29]
""  Last modification		: [Sun 09 Oct 2016 15:05:29]
""

function CreateMakefile()
	%substitute/[\/\*][\*\/]/##/g
	read $HOME/.vim/templates/makefile.vimtpl
endfunction

