""
""  File							: header.vim
""	 Path							: /home/dio/.vim/plugin/header.vim
""  Created by					: Pierre "Za_warudo" SAILLARD
""  Login						: dio
""
""  Started						: [Sun 09 Oct 2016 01:42:06]
""  Last modification		: [Thu 27 Oct 2016 22:19:16]
""

function InsertHeader()
	let s:ext = expand('%:e')
	let s:file = expand('%:t')

	"copy the template at the beginning of the file
	"delete the empty line at the file's first line
	normal gg
	execute "read ".g:VIMTEMPLATES."headerDefault.vimtpl"
	normal ggdd

	"this 'if' statement is absolutely unneccesary unless you prefer your header commented
	"using the pair '/*' and '*/' (it's my case).
	if (s:ext != 'c' && s:ext != 'cpp' && s:ext != 'h' && s:ext != 'hh')
		1,9substitute/^[\/\*][\*\/]/\=g:dictComments[s:ext]/
	endif


	"replace fillers
	let s:headerstart = 1
	let s:headerend = 9
	execute s:headerstart.",".s:headerend."substitute/USERFNAME \"USERNNAME\" USERLNAME/".g:userFirstName." \"".g:userNickName."\" ".g:userLastName."/"
	1,9substitute/CURRENTFILENAME/\=s:file
	1,9substitute/CURRENTFILEPATH/\=expand('%:p')
	1,9substitute/USERLOGIN/\=$USER/
	1,9substitute/DATEOFTHEDAY/\=strftime("%a %d %b %Y %T", localtime())/

	"add an Include Guard if the file is a .h or .hh file
	if (s:ext == 'h' || s:ext == 'hh')
		call Includeguard(s:file)
	endif

	"add a Shebang if necessary
	if (has_key(g:dictShebang, s:ext))
		call Shebang(g:dictShebang[s:ext])
	endif
	normal G
endfunction

function Shebang(interp)
	"add a shebang formated like this => #!/usr/bin/(interp)
	normal ggO
	execute "normal 0d$i#!/usr/bin/".a:interp
endfunction


function Includeguard(filename)
	"if the file is a .h or a .hh, this function add basic include guards
	normal Go
	let s:fname = a:filename
	let s:file = substitute(toupper(s:fname), '\.', "_", "")
	echo s:fname

	execute "read ".g:VIMTEMPLATES."includeguardC.vimtpl"
	.,.+3 substitute/CURRENTHEADERNAME/\=s:file/g
endfunction

function UpdateHeader()
	"update last modification date
	let s:curpos = getcurpos()
	let s:lastmod = "Last modification\t\t: [".strftime("%a %d %b %Y %T", localtime ())."]"
	%substitute/Last modification\s\+:\s\+\[.*]/\=s:lastmod/e
	call setpos('.', s:curpos)
endfunction
