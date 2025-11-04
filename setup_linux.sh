#!/usr/bin/env bash

# Assumes Ubuntu

insert_dotfile() {
	[ -f ~/$1 ] && mv $1 "$1"_local
	ln -s $1 ~/$1
}

insert_dotfile .gitconfig
insert_dotfile .bashrc
insert_dotfile .tmux.conf ~/.tmux
insert_dotfile .vimrc

ask() {
	while true; do
		read -p "$1 ([y]/n) " -r
		REPLY=${REPLY:-"y"}
		if [[ $REPLY =~ ^[Yy]$ ]]; then
			return 1
		elif [[ $REPLY =~ ^[Nn]$ ]]; then
			return 0
		fi
	done
}

ask "Would you like to install fzf for fuzzy finding and shell completion?" && install_fzf
ask "Would you like to install vim-plug, a simple vim plugin manager?" && install_vim_plug
ask "Would you like to install tldr to explain common usages of commands?" && install_tldr
ask "Would you like to install the rust toolchain?" && install_rust
ask "Would you like to install the ocaml toolchain?" && install_ocaml
ask "Would you like to install the javascript toolchain?" && install_javascript

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
	echo 
}

install_vim_plug() {
	local vim_plug_dir=~/git/vim-plug
	git clone --depth 1 --branch 0.14.0 https://github.com/junegunn/vim-plug.git $vim_plug_dir
	cp $vim_plug_dir/plug.vim ~/.vim/autoload/plug.vim
	cp $vim_plug_dir/plug.vim ~/.local/share/nvim/site/autoload/plug.vim
}

install_tldr() {
	sudo apt-get -y install tldr
}

install_rust() {
	export RUSTUP_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/.rustup"
	export CARGO_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/.cargo"
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
}

install_ocaml() {
	sudo apt-get -y install ocaml
	sudo apt-get -y install utop
}

install_javascript() {
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | sh
	\. "$HOME/.nvm/nvm.sh"
	nvm install 24
}

