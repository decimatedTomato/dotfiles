# DOTFILES

## HOW TO
- Clone this repository
- Back up any dotfiles
- Run setup.sh

## CONTAINS
- Handles 5 different common setups
	1. Linux
	2. Linux (accessed remotely through a mac)
	3. OS X
	4. WSL
	5. MSYS
- Sets similar configuration for basic tools
	1. Bash
	2. Tmux
	3. Git
	4. Vim
	5. Neovim
	6. Zsh

## TODO
- Remove the section in the vimrc that involves plugins if the user does not want to install a plugin manager
- Install common software the user might want
	- Fzf
		- Check if fzf exists, if so use that fzf_dir instead of the hardcoded one
		- Remove and replace fzf config section from bashrc when setup script is run
			- Use a multiline sed command
		- Add support for other shells
	- Tldr
	- Jq
	- Xdd
	- Tree
	- Tig
	- Netcat
	- Htop
- Install devtools a user might want
	- Vimplug
	- Make
	- Node
	- Utop/Dune
	- Cargo
	- Fzf for vim