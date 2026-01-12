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
# go up one directory
alias ..="cd .."

# alias nvim to vim
alias vim="nvim"

# Add alias for thefuck to fix commands
eval $(thefuck --alias)

# Add GNU tools to PATH (for Doom Emacs compatibility)
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

export PATH="/Users/scott/.local/bin:$PATH"

# Add Doom emacs to PATH
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"

# add poetry to path
export PATH="$HOME/.poetry/bin:$PATH"

# Rust cargo
. "$HOME/.cargo/env"

source <(fzf --zsh)

# fnm (Fast Node Manager)
eval "$(fnm env --use-on-cd)"

# Zoxide
eval "$(zoxide init zsh)"

# initialize starship prompt
eval "$(starship init zsh)"
