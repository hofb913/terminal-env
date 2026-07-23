# User configuration

# Preferred editor for local and remote sessions
export EDITOR="nvim"
export VISUAL="nvim"

# Run Homebrew's enviroment setup command - shellev
eval "$(/opt/homebrew/bin/brew shellenv)"

# Setup pyenv 
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# starship --> shell command prompt
# Use default location for starship.toml --> $HOME/.config/starshiop.toml
# export STARSHIP_CONFIG="$HOME/.config/starship.toml"
eval "$(starship init zsh)"

# zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zoxide --> A smarter cd command
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# direnv --> Automatic Env Managemnent
if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# fzfnd --> fuzzy finder fo the terminal
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Aliases  (run alias for a complete list)

# Better defaults
alias ls="eza --icons auto"
alias cat="bat"

# Git shortcuts
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gca="git commit -a"
alias gp="git push"
alias gl="git pull"
alias gd="git diff"
alias gco="git checkout"
alias gcb="git checkout -b"

# Misc helpers
alias c="clear"
alias ..="cd .."
alias ...="cd ../.."
alias lz="lazygit"

