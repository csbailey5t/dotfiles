#!/usr/bin/env bash
# Bootstrap a fresh macOS machine from these dotfiles.
# Idempotent: safe to re-run. Existing real files are backed up to *.pre-dotfiles.bak.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CASKS=(warp)

log() { printf '\n\033[1;34m==>\033[0m %s\n' "$*"; }

# Symlink $1 -> $2, backing up an existing non-symlink first.
link() {
  local src="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    mv "$dest" "$dest.pre-dotfiles.bak"
    echo "  backed up $dest -> $dest.pre-dotfiles.bak"
  fi
  ln -sfn "$src" "$dest"
  echo "  linked $dest"
}

# --- Homebrew ---------------------------------------------------------------
if ! command -v brew >/dev/null 2>&1; then
  log "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

log "Installing Homebrew formulae (brew-installs.txt)"
# shellcheck disable=SC2046
brew install $(grep -vE '^\s*(#|$)' "$DOTFILES/brew-installs.txt")

log "Installing Homebrew casks"
brew install --cask "${CASKS[@]}" || true

# --- Symlinks ---------------------------------------------------------------
log "Symlinking shell configs"
link "$DOTFILES/.zshrc"           "$HOME/.zshrc"
link "$DOTFILES/.zsh_plugins.txt" "$HOME/.zsh_plugins.txt"
link "$DOTFILES/.mdlrc"           "$HOME/.mdlrc"
link "$DOTFILES/markdownstyle.rb" "$HOME/markdownstyle.rb"

log "Symlinking app configs"
link "$DOTFILES/ghostty/config"   "$HOME/.config/ghostty/config"
link "$DOTFILES/zed/settings.json" "$HOME/.config/zed/settings.json"
link "$DOTFILES/zed/keymap.json"   "$HOME/.config/zed/keymap.json"
link "$DOTFILES/doom"             "$HOME/.config/doom"

# --- Doom Emacs -------------------------------------------------------------
if [ ! -d "$HOME/.config/emacs" ]; then
  log "Cloning Doom Emacs"
  git clone --depth 1 https://github.com/doomemacs/doomemacs "$HOME/.config/emacs"
fi
log "Running doom sync"
"$HOME/.config/emacs/bin/doom" sync

# --- Node (fnm) -------------------------------------------------------------
log "Installing Node LTS via fnm"
eval "$(fnm env)"
fnm install --lts
fnm default lts-latest

# --- Python (uv) ------------------------------------------------------------
log "Installing Python via uv"
uv python install 3.14 --default --preview

log "Done. Open a new terminal to load the new shell."
echo "Remaining manual steps: install Dank Mono font, and run 'M-x nerd-icons-install-fonts' in Emacs."
