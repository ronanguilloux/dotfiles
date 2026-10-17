.files
=======

My commented dotfiles (bash, vim, git, etc.), fruits of long-term endeavour in dotfiles fans thursday night parties dotfiles related blogposts reading, dotfiles github repositories crawling, etc.

Dependencies
------------

Many shell files (tools, etc.) aliases in the .bash_aliases conf file are in `git@github.com:ronanguilloux/Bin.git`
This is why Bin.git is mentionned below in the install procedure.

Installation
------------

Install [Brew](https://brew.sh/) and [Node](https://nodejs.org/) (the Brewfile has an npm entry), then:

``` bash
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/ronanguilloux/dotfiles.git
    git clone https://github.com/ronanguilloux/Bin.git
    dotfiles/install.sh
    brew bundle --global
    vim +PlugInstall +qa
```

The install.sh will move the original .bashrc file and the .vim directory found in $HOME before changing using symbolic links, in case there were already modified.

Brew packages: .Brewfile
------------------------

`.Brewfile` (symlinked to `~/.Brewfile`) lists the brew formulae, casks, uv tools and npm globals shared by every laptop;
`brew bundle --global` installs them. Tools for one machine only go in an untracked `~/.Brewfile.local`, same syntax, included automatically.

When you install something new, record it: `brew bundle add --global <formula>` (`--cask`, `--uv`, `--npm` for other kinds),
or edit the file. The daily background upgrade in `.zshrc` also compares the Brewfile with what's installed, and new shells print
a `brew: …` line when they differ, until you fix it (editing the Brewfile hides it right away).

VS Code
-------

Not in this repo: settings, keybindings, snippets and extensions travel with VS Code's built-in Settings Sync.
On each new laptop: Accounts menu (bottom-left) → *Backup and Sync Settings…* → sign in with GitHub.
If work policy blocks it there, use *Profiles → Export Profile…* on the old laptop and import it on the new one.

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
