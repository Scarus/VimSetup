#!/bin/sh

PACKAGES="
vim-nerdtree
vim-surround
vim-tagbar
vim-syntastic
vim-nerdcommenter
vim-latexsuite
vim-molokai
vim-seti
vim-ale
"

VIMPLUGINPATH="$HOME/.vim/pack/plugins/start"
mkdir -p $VIMPLUGINPATH
cd $VIMPLUGINPATH
git clone git://github.com/OmniSharp/omnisharp-vim

cd -
sudo pacman -Sy vim
sudo pacman -Sy $PACKAGES
