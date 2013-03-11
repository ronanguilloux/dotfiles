dotfiles
========

My beloved little scripts, fruits of long-term endeavour in dotfiles fans thursday night parties, dotfiles related blogposts reading, dotfiles github repositories crawling, etc.


Installation
------------

Arriving in a new brand server trough ssh, just run this :

``` bash
    sudo apt-get install git 
    git clone git@github.com:ronanguilloux/dotfiles.git
    dotfiles./install.sh
```

Preventing privacy & security issues
------------------------------------

For credentials, tokens & other secret stuff, use local files :

```
    # ~/.gitconfig.local
    [user]
        name = Ronan Guilloux
        email = ronan.guilloux@gmail.com
    [github]
        user = ronanguilloux
        token = 7788bc06d8ae6e7664dc2193e16971
```


License Information
-------------------

* You can find a copy of this files here: https://github.com/ronanguilloux/dotfiles
* WTFPL - see LICENSE file


Contributing
------------

The issue queue can be found at: https://github.com/ronanguilloux/dotfiles/issues

