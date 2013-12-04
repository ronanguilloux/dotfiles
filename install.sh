#!/bin/bash

# move original dotfiles 
if [ -f /.zshrc ]
then
    mv -f ~/.zshrc ~/.zshrc-dist
fi
if [ -f /.bashrc ]
then
    mv -f ~/.bashrc ~/.bashrc-dist
fi
if [ -f /.bash_aliases ]
then
    mv -f ~/.bash_aliases ~/.bash_aliases-dist
fi
if [ -d /.vim ]
then
    mv -f ~/.vim ~/.vim-dist
fi
if [ -f /.gitignore_global ]
then
    mv -f ~/.gitignore_global ~/.gitignore_global-dist
fi
if [ -f /.gitconfig ]
then
    mv -f ~/.gitconfig ~/.gitconfig.local
fi
if [ -f ~/.zshrc.pre-oh-my-zsh ]
then
    mv ~/.zshrc.pre-oh-my-zsh  ~/.zshrc.pre-oh-my-zsh-dist
fi

# create symlinks
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zshrc.pre-oh-my-zsh ~/.zshrc.pre-oh-my-zsh
ln -s ~/dotfiles/.zshrcre- ~/.zshrc
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.bash_aliases ~/.bash_aliases
echo "done."

