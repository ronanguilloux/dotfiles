# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# curl -fLo ~/.oh-my-zsh/plugins/docker/_docker https://raw.github.com/felixr/docker-zsh-completion/master/_docker
plugins=(git github osx docker docker-compose brew composer npm symfony2 vagrant httpie)

# User configuration
export EDITOR=/usr/bin/vim
source $HOME/.bash_aliases
if [ -f $HOME/.bash_aliases.local ]
then
    source $HOME/.bash_aliases.local
fi
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/texbin:/Users/ronan/.rvm/bin"
source $HOME/.pathes
# Github's hub command: https://github.com/github/hub: brew install hub
#eval "$(hub alias -s)"
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

# Antigen: cd ~ && git clone https://github.com/zsh-users/antigen.git .antigen 
source "/Users/ronan/dotfiles/antigen.zsh"
antigen use oh-my-zsh
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle arialdomartini/oh-my-git
antigen theme arialdomartini/oh-my-git-themes oppa-lana-style
antigen theme arialdomartini/oh-my-git-themes arialdo-granzestyle
antigen apply
# use antigen update to update it all


# export MANPATH="/usr/local/man:$MANPATH"
source $ZSH/oh-my-zsh.sh

# GOPATH
if [ -d "/usr/local/go/bin" ] ; then
    export GOROOT="/usr/local/go"
    export GOPATH="/usr/local/go/bin"
    export PATH="$GOPATH:$PATH"
fi

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH="/usr/local/opt/php@7.1/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/sbin:$PATH"
export PATH="/usr/local/opt/elasticsearch@5.6/bin:$PATH"

# this is the root folder where all globally installed node packages will  go
export NPM_PACKAGES="/usr/local/npm_packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
# add to PATH
export PATH="$NPM_PACKAGES/bin:$PATH"
export PATH="$HOME/.npm-packages/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ronan/google-cloud/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/ronan/google-cloud/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ronan/google-cloud/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/ronan/google-cloud/google-cloud-sdk/completion.zsh.inc'; fi

# BEGIN SNIPPET: Magento Cloud CLI configuration
HOME=${HOME:-'/Users/ronan'}
export PATH="$HOME/"'.magento-cloud/bin':"$PATH"
if [ -f "$HOME/"'.magento-cloud/shell-config.rc' ]; then . "$HOME/"'.magento-cloud/shell-config.rc'; fi # END SNIPPET
