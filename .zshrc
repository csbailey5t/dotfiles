source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load

# Aliases 
alias bup="brew update && brew upgrade"
# copy the working directory path
alias cpwd="pwd|tr -d '\n'|pbcopy"
# alias for deleting
alias rm="rm -i"
# better ls 
alias ls="eza -la --icons"
alias ll="ls"

# alias nvim to vim
alias vim="nvim"

# Add alias for thefuck to fix commands
eval $(thefuck --alias)

export PATH="/Users/scott/.local/bin:$PATH"

# Add Doom emacs to PATH
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"

# add poetry to path 
export PATH="$HOME/.poetry/bin:$PATH"

source <(fzf --zsh)

eval "$(pixi completion --shell zsh)"

# Zoxide
eval "$(zoxide init zsh)"

source /Users/scott/.config/broot/launcher/bash/br

# initialize starship prompt
eval "$(starship init zsh)"
