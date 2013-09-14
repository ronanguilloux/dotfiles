# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"


# Brew tab-completion
#fpath=($HOME/.zsh/func $fpath)
#typeset -U fpath

# Customize to your needs...
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export PATH=${PATH}:~/Workspace/adt/sdk/platform-tools:~/Workspace/adt/sdk/tools

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
export EDITOR=/usr/bin/vim
source $HOME/.bash_aliases
if [ -f $HOME/.bash_aliases.local ]
then
    source $HOME/.bash_aliases.local
fi
source $ZSH/oh-my-zsh.sh

plugins=(git)
PROMPT='%{$fg[cyan]%}%n%{$fg[white]%}@%{$fg[cyan]%}%m%{$fg_bold[green]%}:%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

