# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/scott/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

DEFAULT_USER=`whoami`

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
COMPLETION_WAITING_DOTS="true"

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
plugins=(git npm brew zsh-z zsh-autosuggestions bundler python pip vi-mode deno asdf)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias bup="brew update && brew upgrade"
# copy the working directory path
alias cpwd="pwd|tr -d '\n'|pbcopy"
# alias for deleting
alias rm="rm -i"

# alias nvim to vim
alias vim="nvim"

# Add rbenv to path
# eval "$(rbenv init -)"


# Add alias for thefuck to fix commands
eval $(thefuck --alias)

# load pyenv
# eval "$(pyenv init -)"
# Add to path for pipsi 
# export PATH=/Users/csb5t/.local/bin:$PATH
# . /Users/csb5t/anaconda3/etc/profile.d/conda.sh
# export PATH="/usr/local/opt/postgresql@10/bin:$PATH"
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
export PATH="/Users/scott/.local/bin:$PATH"

export PATH="~/.ghcup/bin:$PATH"

# opam configuration
# test -r /Users/scott/.opam/opam-init/init.zsh && . /Users/scott/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# NVM config
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

#RBENV
# eval "$(rbenv init -)"

# Add Doom emacs to PATH
export PATH="$HOME/.emacs.d/bin:$PATH"

# add poetry to path 
export PATH="$HOME/.poetry/bin:$PATH"

# initialize starship prompt
eval "$(starship init zsh)"

export PATH=/opt/homebrew/opt/emacs-plus@29/bin:$PATH

# source /Users/scott/.config/broot/launcher/bash/br

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# opam configuration
# test -r /Users/scott/.opam/opam-init/init.zsh && . /Users/scott/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

. /opt/homebrew/opt/asdf/libexec/asdf.sh

alias ls="eza -la --icons"

#[ -f "/Users/scott/.ghcup/env" ] && source "/Users/scott/.ghcup/env" # ghcup-env
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

[ -f "/Users/scott/.ghcup/env" ] && source "/Users/scott/.ghcup/env" # ghcup-env

alias tidy="/opt/homebrew/Cellar/tidy-html5/5.8.0/bin/tidy"
eval "$(pixi completion --shell zsh)"
