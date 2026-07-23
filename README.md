# terminal-env

## Release

- { 2026-07-24 } Initial Release

## About

This repository contains the configuration files (`dotfiles`) and command-line tools I use for my macOS terminal-based development environment.

## Repository Structure

```
macos-terminal-env
├── ghostty/           - terminal emulator
├── git/               - gitconfig & global git_ignore
├── nvim/              - editor / IDE
├── starship/          - terminal prompt
├── tmux/              - multiplexer
├── zsh/               - macOS Z shell
├──.stowrc             - GNU Stow resource file
├── Brewfile           - homebrew CLI bundle
├── install.sh         - install script
└── README.md          - this file
```

## Configuration Files

Configuration files (`dotfiles`) are contained within a dedicated directory: ghostty, git, nvim, starship, tmux, and zsh.

Each subdirectory/package is structured for use with [GNU Stow](https://www.gnu.orgsoftware/stow) and mirrors the target filesystem layout.

## Command-line Interface (CLI) and DevOps Tools

A [Homebrew](https://brew.sh/) bundle is provided to automate the installation of the various command-line interface and DevOps tools used in this environment.

<details><summary><b>Brewfile</b></summary>
<br>
The depenencies contained in this bundle support the use of a terminal as the primary development environment.<br>

    Formulae:
    readline                - library for command-line editing
    openSSL@3               - cryptography and SSL/TLS toolkit
    bat                     - a cat(1) clone with wings
    direnv                  - automatic environment management
    eza                     - a modern alternative to ls
    fd                      - a simple & fast alternative to find
    fzf                     - a command-line fuzzy finder
    git                     - version control system
    lazygit                 - terminal UI for git
    sqlite                  - command-line interface for SQLite
    xz                      - general-purpose data compression
    luarocks                - package manager for Lua programming language
    neovim                  - extensible Vim-bsaed text editor
    node                    - JavaScript runtime environment
    pyenv                   - Python version management
    ripgrep                 - lightning-fast search tool
    rust                    - blazingly fast and memory-efficient programming language

starship - cross-shell prompt
stow - symlink farm manager
tcl-tk - graphical UI toolkit
tmux - terminal multiplexer
tree-sitter-cli - parser generator tool
uv - Extremely fast Python package installer/resolver
zlib - lossless data compression SW library
zoxide - a smarter cd command
zsh-autosuggestions - fish-like autosuggestions
zsh-syntax-highlighting - fish-like syntax highlighting
Casks:
font-meslo-lg-nerd-font - nerd font
ghostty - cross-platform terminal emulator

</details>

## Installation

- The target environment for this installation is macOS.
- The installation script, `install.sh`, runs in a Z shell (zsh).

Paste the following in the macOS Terminal:

```
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/hofb913/macos-terminal-env/main/install.sh)"
```

The `install.sh` script performs the following:

1. Installs the Xcode command-line tools
2. Installs & Updates `Homebrew` (macOS package manager)
3. Clones this repo to `~/.dotfiles`
4. Install the dependencies using `brew bundle`
5. Apply configurations using `stow`

---

[![](https://img.shields.io/github/license/hofb913/terminal-env?style=for-the-badge&logo=Github)](https://github.com/hofb913/terminal-env/blob/master/LICENSE)
