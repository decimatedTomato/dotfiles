#!/usr/bin/env zsh

ln -s .gitconfig ~/.gitconfig
ln -s .bashrc ~/.bashrc
ln -s .zshrc ~/.zshrc
ln -s .tmux.conf ~/.tmux.conf 
ln -s .vimrc_mac ~/.vimrc
ln -s nvim/ ~/.config/nvim

while true; do
	read -p "Do you wish to install the package manager brew? (Y/n)" yn
	case $yn in
		[Yy]* )
			/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
			break;;
		[Nn]* ) exit;;
		* ) echo "Answer y or n, cancel with ^C";;
	esac
done

# Setup karabiner
# Setup raycast
