.files
=======

My commented dotfiles (bash, vim, git, etc.), fruits of long-term endeavour in dotfiles fans thursday night parties, dotfiles related blogposts reading, dotfiles github repositories crawling, etc.


Installation
------------

Landing on a new brand server trough ssh, just run this :

``` bash
    $ sudo apt-get install git 
    $ git clone git@github.com:ronanguilloux/dotfiles.git
    $ dotfiles./install.sh
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

