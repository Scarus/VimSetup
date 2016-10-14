""
""  File							: header.vim
""	 Path							: /home/dio/.vim/plugin/header.vim
""  Created by					: Pierre "Za_warudo" SAILLARD
""  Login						: dio
""
""  Started						: [Sun 09 Oct 2016 01:42:06]
""  Last modification		: [Sun 09 Oct 2016 22:44:10]
""

"notes:
" => "%" permet aussi designer le nom du fichier, "expand" permet de formater des caractères spéciaux comme celui là => ":help expand"
" => utiliser "\=" dans une ligne de recherche permet d'interpréter une variable
" pour insérer son résultat dans la ligne
" l'autre solution consiste à utiliser utiliser "execute" pour executer l'expression en concatenant tout

function InsertHeader()
	let s:ext = expand('%:e')
	let s:file = expand('%:t')
	"copie le contenu du template dans le fichier
	"supprime la ligne vide au début

	normal gg
	if (s:ext == "pl" || s:ext == "PL")
		execute Shebang("perl")
		read $HOME/.vim/templates/headerDefault.vimtpl
	elseif (s:ext == "py")
		execute Shebang("python3")
		read $HOME/.vim/templates/headerDefault.vimtpl
	elseif (s:ext == "c" || s:ext == "cpp")
		read $HOME/.vim/templates/headerC.vimtpl
		normal ggdd
	elseif (s:ext == "h" || s:ext == "hh")
		read $HOME/.vim/templates/headerC.vimtpl
		execute Includeguard(s:file)
		normal ggdd
	elseif (s:ext == "sh")
		execute Shebang("sh")
		read $HOME/.vim/templates/headerDefault.vimtpl
	elseif (s:ext == "vim")
		read $HOME/.vim/templates/headerVi.vimtpl
		normal ggdd
	else
		read $HOME/.vim/templates/headerDefault.vimtpl
	endif

	"replace fillers
	execute "%substitute/USERFNAME \"USERNNAME\" USERLNAME/".g:userFirstName." ".g:userNickName." ".g:userLastName."/"
	%substitute/CURRENTFILENAME/\=s:file
	%substitute/CURRENTFILEPATH/\=expand('%:p')
	%substitute/USERLOGIN/\=$USER/
	%substitute/DATEOFTHEDAY/\=strftime("%a %d %b %Y %T", localtime())/

	normal Go
	"echo "Au Boulot feignasse!"
endfunction

function Shebang(interp)
	"add a shebang formated like this => #!/usr/bin/(interp)
	execute "normal ggO#!/usr/bin/".a:interp
endfunction


function Includeguard(filename)
	"if the file is a .h or a .hh, this function add basic include guards
	normal Go
	let s:fname = a:filename
	"utiliser les simple quote et double quote autour du point produit un effet
	"différent
	let s:file = substitute(toupper(s:fname), '\.', "_", "")
	echo s:fname

	read $HOME/.vim/templates/includeguardC.vimtpl
	%substitute/CURRENTHEADERNAME/\=s:file/g
endfunction

function UpdateHeader()
	"update last modification date
	let s:curpos = getcurpos()
	"note affiner la regexp afin de minimiser les chances de remplacer autre
	"chose par erreur (et s'entrainer aux regexp)
	let s:lastmod = "Last modification\t\t: [".strftime("%a %d %b %Y %T", localtime ())."]"
	%substitute/Last modification\s\+:\s\+\[.*]/\=s:lastmod/e
	call setpos('.', s:curpos)
endfunction
