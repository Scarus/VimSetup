""
""  File							: Chelp.vim
""	 Path							: /home/dio/.vim/plugin/Chelp.vim
""  Created by					: Pierre Za_warudo SAILLARD
""  Login						: dio
""
""  Started						: [Sun 09 Oct 2016 22:47:40]
""  Last modification		: [Tue 25 Oct 2016 23:35:15]
""

"generate a cpp style class following the Coplien's form 
function Cclass(class)
	execute "read ".g:VIMTEMPLATES."Cclass.vimtpl"
	%substitute/VIMHASTOREPLACE/\=a:class/e
endfunction

"generate a c/cpp style main function
function Cmain()
	execute "read ".g:VIMTEMPLATES."Cmain.vimtpl"
endfunction

"generate a c/cpp style structure
function Cstruct(struct, typedef)
	execute "read ".g:VIMTEMPLATES."Cstruct.vimtpl"
	execute "%substitute/s_VIMHASTOREPLACE/s_".a:struct."/e"
	if (a:typedef != "")
		execute "%substitute/t_VIMHASTOREPLACE/s_".a:typedef."/e"
	else
		execute "%substitute/t_VIMHASTOREPLACE/s_".a:struct."/e"
	endif
endfunction

"generate a getter and a setter for the specified attribute
function Cgetset(varType, varName, varClass)
	let s:upName = toupper(strpart(a:varName, 0, 1)).strpart(a:varName, 1)
	execute "read ".g:VIMTEMPLATES."Cgetset.vimtpl"
	%substitute/VIMTYPEHASTOREPLACE/\=a:varType/e
	%substitute/VIMNAMEHASTOREPLACE/\=s:upName/ge
	%substitute/VIMCLASSHASTOREPLACE/\=a:varClass/e
endfunction
