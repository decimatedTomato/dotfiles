#!/usr/bin/env bash

ln -s .gitconfig ~/.gitconfig
ln -s .bashrc ~/.bashrc
ln -s .tmux.conf ~/.tmux.conf
ln -s .vimrc_windows ~/.vimrc
echo ":so $script_dir/.vimrc" >> ~/.vimrc

ln -s nvim/ ~/.config/nvim

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

install_fzf() {
	local fzf_dir=~/git/fzf
	mkdir -p $fzf_dir
	git clone --depth 1 --branch v0.66.1 https://github.com/junegunn/fzf.git $fzf_dir
	$fzf_dir/install --bin --key-bindings --completion
	
	local fzf_git_dir=~/git/fzf-git
	mkdir -p $fzf_git_dir
	git clone --depth 1 --branch c823ffd521cb4a3a65a5cf87f1b1104ef651c3de  https://github.com/junegunn/fzf-git.sh.git $fzf_git_dir
	
	cat >> ~/.bashrc <<- EOF
	# Start Fzf config
	if [[ ! "\$PATH" == *$fzf_dir/bin* ]]; then
		PATH="\${PATH:+\${PATH}:}$(printf %q $fzf_dir)/bin"
	fi
	eval "$(fzf --bash)"
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
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}