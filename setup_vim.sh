#!/bin/sh

PACKAGES="
vim-nerdtree
vim-surround
vim-tagbar
vim-syntastic
vim-latexsuite
vim-molokai
vim-seti
vim-ale
"

sudo pacman -Sy vim
sudo pacman -Sy $PACKAGES

# install vim-omnisharp
VIMPLUGINPATH="$HOME/.vim/pack/plugins/start"
mkdir -p $VIMPLUGINPATH
cd $VIMPLUGINPATH
git clone git://github.com/OmniSharp/omnisharp-vim

# install vim-commentary (instead of vim-nerdcommenter to match with vim for vscode)
VIMPLUGINPATH="$HOME/.vim/pack/tpope/start"
mkdir -p $VIMPLUGINPATH
cd $VIMPLUGINPATH
git clone https://tpope.io/vim/commentary.git
vim -u NONE -c "helptags commentary/doc" -c q
