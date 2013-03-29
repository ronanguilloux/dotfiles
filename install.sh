#!/bin/bash

# move original dotfiles 
if [ -f /.bashrc ]
then
    mv -f ~/.bashrc ~/.bashrc-dist
fi
if [ -f /.bash_aliases ]
then
    mv -f ~/.bash_aliases ~/.bash_aliases-dist
fi
if [ -d /.vim ]
    mv -f ~/.vim ~/.vim-dist
fi
if [ -f /.gitignore_global ]
    mv -f ~/.gitignore_global ~/.gitignore_global-dist
fi
if [ -f /.gitconfig ]
    mv -f ~/.gitconfig ~/.gitconfig.local
fi
# create symlinks
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.bash_aliases ~/.bash_aliases
echo "done."

