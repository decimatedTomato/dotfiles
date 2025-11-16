# DOTFILES

## HOW TO
- Clone this repository
- Back up any dotfiles
- Run setup.sh

## CONTAINS
- Handles 5 different common setups
	1. Linux
	2. Linux (with apple keyboard)
	3. OSX
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
- Add check before prompting for installation of tools in case tool already exists on system
- Improve vim settings
- Install devtools a user might want
	- Fzf for vim
- Setup up environment variables to get back and forth between windows and wsls
	- export WIND='/c/Users/username'
	- export UBUNTU='AppData/Local/Packages/CanonicalGroupLimited.Ubuntu_79rhkp1fndgsc/LocalState/rootfs/home/username'
	- export SUSE='AppData/Local/Packages/CanonicalGroupLimited.Ubuntu_79rhkp1fndgsc/LocalState/rootfs/home/username'
	- \\wsl.localhost\openSUSE-Tumbleweed
	- \\wsl.localhost\Ubuntuc
	- C:\MinGW

- unified copy/paste interface on all platforms

- Test setup_linux_mac
- Test setup_linux
- Test setup_osx
- Test setup_msys
- Test setup_wsl
- fix .tmux.conf
	- Want to be able to use my mouse and copy paste selected bits
