.files
=======

My commented dotfiles (bash, vim, git, etc.), fruits of long-term endeavour in dotfiles fans thursday night parties, dotfiles related blogposts reading, dotfiles github repositories crawling, etc.


Dependencies
------------

Many shell files (tools, etc.) aliases in the .bash_aliases conf file are in git@github.com:ronanguilloux/Bin.git
This is why Bin.git is mentionned below in the install procedure.


Installation
------------

Landing on a new brand server trough ssh, just run this :

``` bash
    $ sudo apt-get install git 
    $ git clone git@github.com:ronanguilloux/dotfiles.git
    $ git clone git@github.com:ronanguilloux/Bin.git
    $ dotfiles/install.sh
```

The install.sh will move the original .bashrc file and the .vim directory found in $HOME before changing using symbolic links, in case there were already modified.


Vim bundles installation
------------------------

All [pathogen](http://www.vim.org/scripts/script.php?script_id=2332)-based vim bundles come from git submodules.


To install all of them, you must run two commands: 
* `git submodule init` to initialize your local configuration file, 
* `git submodule update` to fetch all the data from each project and eventually check out the appropriate commit (see the `.gitmodules` file).

``` bash
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


Preventing privacy & security issues
------------------------------------

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

