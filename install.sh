#!/bin/bash
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.bash_aliases ~/.bash_aliases
# just move .bashrc, in case it was already modified 
mv ~/.bashrc ~/.bashrc-dist && ln -s ~/dotfiles/.bashrc ~/.bashrc
mv ~/.vim ~/.vim-dist && ln -s ~/dotfiles/.vim ~/.vim
echo "done."

