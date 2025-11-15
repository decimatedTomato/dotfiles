#!/usr/bin/env bash

if [ -x "$(command -v apt-get)" ]; then
	package_install='sudo apt-get -y install'
elif [ -x "$(command -v zypper)" ]; then
	package_install='sudo zypper -y install'
elif [ -x "$(command -v pacman)" ]; then
	package_install='sudo pacman --noconfirm -S'
else
	echo 'Package manager not found.'
	exit 1
fi

insert_dotfile .gitconfig
insert_dotfile .bashrc
insert_dotfile .tmux.conf
insert_dotfile .vimrc

ask "Would you like to install fzf for fuzzy finding and shell completion?" && install_fzf
ask "Would you like to install vim-plug, a simple vim plugin manager?" && install_vim_plug
ask "Would you like to install the rust toolchain?" && install_rust
ask "Would you like to install the javascript toolchain?" && install_javascript
ask "Would you like to install the ocaml toolchain?" && package_install ocaml utop
ask "Would you like to install tldr to explain common usages of commands?" && install_tldr
ask "Would you like to install jq to edit json?" && package_install jq

install_fzf() {
	local fzf_dir=~/git/fzf
	mkdir -p $fzf_dir
	git clone --depth 1 --branch v0.66.1 \
		https://github.com/junegunn/fzf.git $fzf_dir
	$fzf_dir/install --xdg --key-bindings --completion --no-update-rc --no-fish --no-zsh
	local fzf_git_dir=~/git/fzf-git
	mkdir -p $fzf_git_dir
	git clone --depth 1 --branch c823ffd521cb4a3a65a5cf87f1b1104ef651c3de \
		https://github.com/junegunn/fzf-git.sh.git $fzf_git_dir
	cat >> ~/.bashrc <<- EOF
	# Start Fzf config
	[ -f ~/.config/fzf/fzf.bash ] && source ~/.config/fzf/fzf.bash
	source $fzf_git_dir/fzf-git.sh
	# End Fzf config
	EOF
}

install_vim_plug() {
	local vim_plug_dir=~/git/vim-plug
	git clone --depth 1 --branch 0.14.0 https://github.com/junegunn/vim-plug.git $vim_plug_dir
	cp $vim_plug_dir/plug.vim ~/.vim/autoload/plug.vim
	cp $vim_plug_dir/plug.vim ~/.local/share/nvim/site/autoload/plug.vim
}

install_rust() {
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
}

install_tldr() {
	package_install tldr
	[ $? -ne 0 ] && sudo cargo install tldrx && echo 'alias tldr=tldrx' >> ~/.bashrc
}

install_javascript() {
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | sh
	\. "$HOME/.nvm/nvm.sh"
	nvm install 24
}

