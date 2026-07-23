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

##  Command-line Interface (CLI) and DevOps Tools
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
 	starship                - cross-shell prompt
	stow                    - symlink farm manager
	tcl-tk                  - graphical UI toolkit
	tmux                    - terminal multiplexer
	tree-sitter-cli         - parser generator tool
 	uv                      - Extremely fast Python package installer/resolver
	zlib                    - lossless data compression SW library
	zoxide                  - a smarter cd command
	zsh-autosuggestions     - fish-like autosuggestions
	zsh-syntax-highlighting - fish-like syntax highlighting
	
	Casks:
	font-meslo-lg-nerd-font - nerd font
	ghostty                 - cross-platform terminal emulator


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

___

[![](https://img.shields.io/github/license/hofb913/dotfiles?style=for-the-badge&logo=Github)](https://github.com/hofb913/term-bootstrap/blob/master/LICENSE)

---
Annotations: 0,3758 SHA-256 fc396e080bc10307f2d0  
&Writing Tools:   
@b hofley <Vh>: 14 36,2 39,2 68,149 238,23 273,31 309,2 312,47 368,30 411,28 447,29 484,31 518,45 566,42 622,26 661,25 687,89 785,74 887,4 896 929,2 972 977,46 1024,13 1053,309 1370,50 1421,2 1432,48 1481 1485,49 1535 1542,54 1599,49 1649 1652,61 1716,52 1771,23 1816,3 1827,17 1865,4 1873,18 1905 1926 1929,56 1986 1996,16 2058 2065,53 2119 2125,20 2177 2183,20 2230 2238,129 2368,2 2378,36 2415 2420,42 2463,47 2511 2516,42 2559 2575,32 2608,2 2613,22 2684,2 2690,58 2749 2756,40 2797 2817,32 2850 2874,79 2954,59 3014 3016,11 3045,168 3285,18 3309,7 3325,2 3331,19 3438 3447 3472,4 3482,10 3493,20 3521,4 3537,24 3588 3593 3595 3601 3652,8 3693  
...
