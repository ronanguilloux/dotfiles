.files
=======

My commented dotfiles (bash, vim, git, etc.), 
fruits of long-term endeavour in dotfiles fans thursday night parties, 
dotfiles related blogposts reading, dotfiles github repositories crawling, etc.


Dependencies
------------

Many shell files (tools, etc.) aliases in the .bash_aliases conf file are in git@github.com:ronanguilloux/Bin.git
This is why Bin.git is mentionned below in the install procedure.


Installation
------------

Landing on a new brand server trough ssh, just run this :

``` bash
    $ brew install ponysay fortune
    $ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    $ git clone git://github.com/ronanguilloux/dotfiles.git
    $ git clone git://github.com/ronanguilloux/Bin.git
    $ git clone git://github.com/zsh-users/antigen.git .antigen
    $ dotfiles/install.sh
```

The install.sh will move the original .bashrc file and the .vim directory found in $HOME before changing using symbolic links, in case there were already modified.

Suggestions
-----------

- https://github.com/arzzen/calc.plugin.zsh
- https://github.com/zsh-users/zsh-syntax-highlighting
- https://github.com/voronkovich/sf2.plugin.zsh
- https://github.com/horosgrisa/mysql-colorize



Installation on Microsoft™ Windows®
-----------------------------------

¯\\\_(ツ)\_/¯

VIM: bundles installation
-------------------------

All [pathogen](http://www.vim.org/scripts/script.php?script_id=2332)-based vim bundles come from git submodules.


To install all of them, you must run two commands: 
* `git submodule init` to initialize your local configuration file, 
* `git submodule update` to fetch all the data from each project and eventually check out the appropriate commit (see the `.gitmodules` file).

``` bash
    $ git config --global url."https://".insteadOf git://
    $ git submodule init
    $ git submodule update
```

To add a new submodule:

``` bash
    $ git submodule add git://github.com/mbbill/code_complete.git .vim/bundle/code_complete
```

To update submodules
``` bash
    $ git submodule foreach git pull origin master
```

ZSH: how to mix .zhrc & ho-my-zsh
---------------------------------

In order to use the current .zshrc with oh-my-zsh, just add a symink in the `~/.oh-my-zsh/custom` directory:

``` bash
    $ cd .oh-my-zsh/custom/
    $ ln -s $HOME/dotfiles/.zshrc local.zsh
```

Binaries dependencies: The `./dotfiles/.zshrc` file depends on some ~/Bin/sh/*.sh files in [ronanguilloux/Bin](https://github.com/ronanguilloux/Bin/tree/master/sh)

([Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) is a community-driven framework for managing your zsh configuration)

GIT: Preventing privacy & security issues
-----------------------------------------

For credentials, tokens & other secret stuff, use .local files :

```
    # ~/.gitconfig.local
    [user]
        name = John Doe
        email = john@doe.com
    [github]
        user = johndoe
        token = 88bc06d8a...
```

which is already mentionned inside the .gitconfig file you'll found here:


```
    # ~/dotfiles/.gitconfig
    [include]
        # For username / creds / etc
        path = ~/.gitconfig.local
```


License Information
-------------------

* You can find a copy of this files here: https://github.com/ronanguilloux/dotfiles
* WTFPL - see LICENSE file


Issues & Contributions
----------------------

The issue queue can be found at: https://github.com/ronanguilloux/dotfiles/issues

