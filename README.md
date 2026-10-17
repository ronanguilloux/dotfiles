.files
=======

My commented dotfiles (bash, vim, git, etc.), fruits of long-term endeavour in dotfiles fans thursday night parties dotfiles related blogposts reading, dotfiles github repositories crawling, etc.

Dependencies
------------

Many shell files (tools, etc.) aliases in the .bash_aliases conf file are in `git@github.com:ronanguilloux/Bin.git`
This is why Bin.git is mentionned below in the install procedure.

Installation
------------

Install [Brew](https://brew.sh/)

``` bash
    brew install ponysay fortune rtk gemini-cli mole ngrok gh uv zsh-history-substring-search zsh-syntax-highlighting
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/ronanguilloux/dotfiles.git
    git clone https://github.com/ronanguilloux/Bin.git
    dotfiles/install.sh
    vim +PlugInstall +qa
```

The install.sh will move the original .bashrc file and the .vim directory found in $HOME before changing using symbolic links, in case there were already modified.

Suggestions
-----------

- https://github.com/arzzen/calc.plugin.zsh
- https://github.com/voronkovich/sf2.plugin.zsh
- https://github.com/horosgrisa/mysql-colorize

VIM: plugins
------------

Plugins are managed by [vim-plug](https://github.com/junegunn/vim-plug) (vendored in `.vim/autoload/plug.vim`).
They are the `Plug '…'` lines in `.vimrc`, installed into the untracked `.vim/plugged/`.

- `vim +PlugInstall +qa`: install them (once per machine, and after adding a `Plug` line)
- `:PlugUpdate`: update them
- `:PlugClean`: remove the ones whose `Plug` line was deleted

ZSH: .zshrc & oh-my-zsh
-----------------------

`install.sh` symlinks `~/.zshrc`, which loads oh-my-zsh itself, then the Homebrew `zsh-history-substring-search` and `zsh-syntax-highlighting` plugins: no `~/.oh-my-zsh/custom/local.zsh` symlink needed.

Binaries dependencies: The `./dotfiles/.zshrc` file depends on some ~/Bin/sh/*.sh files in [ronanguilloux/Bin](https://github.com/ronanguilloux/Bin/tree/master/sh)

([Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) is a community-driven framework for managing your zsh configuration)

GIT: Preventing privacy & security issues
-----------------------------------------

For credentials, tokens & other secret stuff, use .local files :

```text
    # ~/.gitconfig.local
    [user]
        name = John Doe
        email = john@doe.com
    [github]
        user = johndoe
        token = 88bc06d8a...
```

which is already mentionned inside the .gitconfig file you'll found here:

```text
    # ~/dotfiles/.gitconfig
    [include]
        # For username / creds / etc
        path = ~/.gitconfig.local
```

License Information
-------------------

- You can find a copy of this files here: https://github.com/ronanguilloux/dotfiles
- WTFPL - see LICENSE file

Issues & Contributions
----------------------

The issue queue can be found at: https://github.com/ronanguilloux/dotfiles/issues
