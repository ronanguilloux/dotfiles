#!/bin/bash

# Back up original dotfiles in $HOME as X-dist, then symlink ~/dotfiles/X → ~/X.
# Existing symlinks are not backed up, so re-running keeps the first backup.
for f in .zshrc .pathes .bashrc .bash_aliases .vim .vimrc .gitignore_global .gitconfig; do
    if [ -e ~/$f ] && [ ! -L ~/$f ]; then
        backup=~/$f-dist
        # never overwrite (file) or nest into (dir) an older backup
        [ -e "$backup" ] && backup="$backup.$(date +%Y%m%d%H%M%S)"
        mv ~/$f "$backup"
    fi
    ln -sfn ~/dotfiles/$f ~/$f
done
echo "done."
