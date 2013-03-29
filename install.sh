#!/bin/bash

# move original dotfiles 
mv ~/.bashrc ~/.bashrc-dist
mv ~/.vim ~/.vim-dist
mv ~/.gitconfig ~/.gitconfig.local

# create symlinks
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.bash_aliases ~/.bash_aliases
echo "done."

