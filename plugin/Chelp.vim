""
""  File							: Chelp.vim
""	 Path							: /home/dio/.vim/plugin/Chelp.vim
""  Created by					: Pierre Za_warudo SAILLARD
""  Login						: dio
""
""  Started						: [Sun 09 Oct 2016 22:47:40]
""  Last modification		: [Mon 10 Oct 2016 00:27:44]
""

function Cclass(class)
	execute "read ".g:VIMTEMPLATES."Cclass.vimtpl"
	%substitute/VIMHASTOREPLACE/\=a:class/e
endfunction

function Cmain()
	execute "read ".g:VIMTEMPLATES."Cmain.vimtpl"
endfunction

function Cstruct(struct, typedef)
	execute "read ".g:VIMTEMPLATES."Cstruct.vimtpl"
	execute "%substitute/s_VIMHASTOREPLACE/s_".a:struct."/e"
	if (a:typedef != "")
		execute "%substitute/t_VIMHASTOREPLACE/s_".a:typedef."/e"
	else
		execute "%substitute/t_VIMHASTOREPLACE/s_".a:struct."/e"
	endif
endfunction
