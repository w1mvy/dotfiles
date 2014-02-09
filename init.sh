#!/bin/sh
ln -s -f $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s -f $HOME/dotfiles/.zshrc $HOME/.zshrc

git submodule init
git submodule update

# setting vim
if [ ! -d ~/.vim/bundle ]; then mkdir -p ~/.vim/bundle ;fi
git clone git://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
vim +BundleInstall +qall
ln -s $HOME/.vim/bundle/vimproc/autoload/* $HOME/.vim/autoload
ln -s $HOME/.vim/bundle/vimproc/plugin/* $HOME/.vim/plugin
source ~/.zshrc
