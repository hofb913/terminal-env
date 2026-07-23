#!usr/bin/env zsh

set -euo pipefail

# install.zsh
#   Install / Re-install macOS Terminal and Dev environment

# Configs 

DOTFILES_REPO="https://github.com/hofb913/terminal-env.git"
DOTFILES_DIR="$HOME/.dotfiles"

# ---------------------------------
# Helpers
# ---------------------------------

LOG_FILE="$HOME/dotfiles-install.log"
exec > >(tee -i "$LOG_FILE") 2>&1

log() {
    printf "\n\033[1;34m==> %s\033[0m\n" "$1"
}

warn() {
    printf "\n\033[1;33m[WARN] %s\033[0m\n" "$1"
}

error() {
    printf "\n\033[1;31m[ERROR] %s\033[0m\n" "$1"
}

exists() {
    command -v "$1" >/dev/null 2>&1
}

# ---------------------------------
# Intall Xcode Commnand Line Tools 
# ---------------------------------

install_xcode_cli() {
    if xcode-select -p &>/dev/null; then
        log "XCode Command Line Tools already installed"
    else 
        log "Installing Xcode Command Line Tools"
        xcode-select --install || install_homebrew
        
        log "Waiting for install..."
        until xcode-select -p &>/dev/null; do 
            sleep 5
        done 
    fi 
}

# ---------------------------------
# Install Homebrew 
# ---------------------------------

install_homebrew() {
  if exists brew; then
    log "Homebrew already installed"
  else
    log "Installing Homebrew"
    NONINTERACTIVE=1 /bin/bash -c \
      "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  # Ensure brew is usable immediately
  if [[ -d "/opt/homebrew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  log "Updating Homebrew"
  brew update
}

# ---------------------------------
# Clone Dotfiles 
# ---------------------------------

clone_dotfiles() {
    if [[ -d "$DOTFILES_DIR/.git" ]]; then
        log "Dotfile already exist -> pulling latest"
        git -C "$DOTFILES_DIR" pull --rebase
    else 
        log "Cloning dotfiles repo"
        git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
    fi 
}

# ---------------------------------
#  Brewfile Imstall
# ---------------------------------

install_brew_packages() {
    log "Installing packages via Brewfile"

    local targets=("$@")
    local brewfiles=()

    if [[ ${#targets[@]} -eq 0 ]]; then
        brewfiles=("$DOTFILES_DIR"/Brewfile*)
    else 
        for t in "${targets[@]}"; do 
            brewfiles+=("$DOTFILES_DIR/Brewfile.$t")
        done 
    fi 

    for file in "${brewfiles[@]}"; do 
        if [[ ! -f "$file" ]]; then 
            warn "Skipping missing $file"
            continue
        fi 

        log "Processing $(basename "$file")"

        if brew bundle check --file="$file" >/dev/null 2>&1; then 
            log "$(basename "$file"): already satisfied"
        else 
            brew bundle --file="$file"
        fi 
    done 
}

# ---------------------------------
# Stow Install
# ---------------------------------

ensure_stow() {
    if ! exists stow; then
        log "Installing stow"
        brew install stow
    fi 
}

# ---------------------------------
# Apply .dotfiles 
# ---------------------------------

apply_dotfiles() {
    log "Applying dotfiles with stow"

    cd "$DOTFILES_DIR"

    for pkg in ghostty git nvim starship tmux zsh; do 
        stow -R "$pkg"
    done 

#    for dir in */; do 
#        # Skip hidden/system dirs just in case
#        [[ "$dir" == .* ]] && continue
#        stow -R "${dir%/}"
#    done 
}

# ---------------------------------
# Shell setup
# ---------------------------------

set_default_shell(){
    if exists zsh; then 
        ZSH_PATH=$(which zsh)

        if [[ "$SHELL" != "$ZSH_PATH" ]]; then 
            log "Setting zsh as default shell"
            chsh -s "$ZSH_PATH"
        else
            log "zsh already default shell"
        fi  
    fi 
}

# ---------------------------------
# Main
# ---------------------------------

main(){
    log "Starting dotfiles intall"

    install_xcode_cli
    install_homebrew
    clone_dotfiles
    install_brew_packages 
    ensure_stow
    apply_dotfiles
    set_default_shell

    log "✅ Dotfiles installation complete!"
    echo "👉 Restart terminal or run: exec zsh"
}

main "$@"
