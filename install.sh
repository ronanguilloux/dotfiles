#!/bin/bash

# Back up original dotfiles in $HOME as X-dist, then symlink ~/dotfiles/X → ~/X.
# Existing symlinks are not backed up, so re-running keeps the first backup.
for f in .zshrc .pathes .zshrc.pre-oh-my-zsh .bashrc .bash_aliases .vim .vimrc .gitignore_global .gitconfig; do
    if [ -e ~/$f ] && [ ! -L ~/$f ]; then
        mv -f ~/$f ~/$f-dist
    fi
    ln -sfn ~/dotfiles/$f ~/$f
done
echo "done."
