# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)


# Customize to your needs...
export EDITOR=/usr/bin/vim
source $HOME/.bash_aliases
if [ -f $HOME/.bash_aliases.local ]
then
    source $HOME/.bash_aliases.local
fi
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

source $HOME/.pathes
fpath=(~/.zsh/completion $fpath)

if [ -d "$HOME/Workspace/adt/sdk/" ] ; then
    export PATH=$PATH:$HOME/Workspace/adt/sdk/platform-tools:$HOME/Workspace/adt/sdk/tools
fi
if [ -d "$HOME/Bin" ] ; then
    export PATH="$HOME/Bin:$PATH"
fi
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi
if [ -d "/usr/local/heroku/bin" ] ; then
    export PATH="/usr/local/heroku/bin:$PATH"
fi
if [ -d "/usr/local/php5/bin" ] ; then
    export PATH="/usr/local/php5/bin:$PATH"
fi
if [ -d "/usr/local/sbin" ] ; then
    export PATH="/usr/local/sbin:$PATH"
fi

if [ -d "$HOME/.composer/vendor/bin" ] ; then
    export PATH="$HOME/.composer/vendor/bin:$PATH"
fi

if [ -d "$HOME/.rvm/bin" ] ; then
    export PATH="$HOME/.rvm/bin:$PATH"
fi

if [ -d "/Applications/Postgres.app/Contents/Versions/9.4/bin" ] ; then
    export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"
fi

# Antigen: cd ~ && git clone https://github.com/zsh-users/antigen.git .antigen 
source "$HOME/.antigen/antigen.zsh"
antigen-use oh-my-zsh
antigen-bundle git
antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle zsh-users/zsh-history-substring-search
antigen-bundle arialdomartini/oh-my-git
antigen theme arialdomartini/oh-my-git-themes oppa-lana-style
antigen theme arialdomartini/oh-my-git-themes arialdo-granzestyle
antigen-apply
# use antigen update to update it all
source $ZSH/oh-my-zsh.sh
#PROMPT='%{$fg[cyan]%}%n%{$fg[white]%}@%{$fg[cyan]%}%m%{$fg_bold[green]%}:%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

# Github's hub command: https://github.com/github/hub
eval "$(hub alias -s)"


# Fix the slowness of zsh prompt, by removing the git status stuff that slows it down...
#https://gist.github.com/msabramo/2355834
function git_prompt_info() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}${ZSH_THEME_GIT_PROMPT_CLEAN}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}

if [ -f ~/dotfiles/functions.sh ]; then
    . ~/dotfiles/functions.sh
fi

# Brew install archey
if [ -f /usr/local/bin/archey ]; then
    archey
fi

# Vi mode: http://dougblack.io/words/zsh-vi-mode.html
#bindkey -v
#zle -N zle-line-init
#zle -N zle-keymap-select
#export KEYTIMEOUT=1


