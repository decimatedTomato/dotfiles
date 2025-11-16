#!/usr/bin/env bash

install_fzf() {
	local fzf_dir=~/git/fzf
	mkdir -p $fzf_dir
	git clone --depth 1 --branch v0.66.1 \
		https://github.com/junegunn/fzf.git $fzf_dir
	$fzf_dir/install --xdg --key-bindings --completion --no-update-rc --no-fish --no-zsh
	local fzf_git_dir=~/git/fzf-git
	mkdir -p $fzf_git_dir
	git clone --depth 1 https://github.com/junegunn/fzf-git.sh.git $fzf_git_dir
}

install_c() {
	package_install gcc clang make cmake
	package_install g++ \
		|| package_install gcc-c++
}

install_rust() {
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
}

install_javascript() {
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
	\. "$HOME/.nvm/nvm.sh"
	nvm install 24
}

install_vim_plug() {
	local vim_plug_dir=~/git/vim-plug
	git clone --depth 1 --branch 0.14.0 https://github.com/junegunn/vim-plug.git $vim_plug_dir
	cp $vim_plug_dir/plug.vim ~/.vim/autoload/plug.vim
	cp $vim_plug_dir/plug.vim ~/.local/share/nvim/site/autoload/plug.vim
}

install_tldr() {
	package_install tldr \
		|| package_install tlrc \
		|| sudo cargo install tldrx && echo 'alias tldr=tldrx' >> ~/.bashrc_local
}

install_netcat() {
	package_install netcat \
		|| package_install netcat-openbsd
}

get_package_install_command() {
	if [ -x "$(command -v apt-get)" ]; then
		echo 'sudo apt-get -y install'
	elif [ -x "$(command -v zypper)" ]; then
		echo 'sudo zypper -y install'
	elif [ -x "$(command -v pacman)" ]; then
		echo 'sudo pacman --noconfirm -S'
	else
		echo 'Package manager not found.' >&2
		exit 1
	fi
}

install_command=$(get_package_install_command)
package_install() {
	$install_command "$@"
}

insert_dotfile .gitconfig
insert_dotfile .bashrc
insert_dotfile .tmux.conf
insert_dotfile .vimrc
ln -sf $script_dir/.alias ~/.alias

ask "Install *curl* to make network requests?" && package_install curl
ask "Install some *c* toolchain stuff?" && install_c
ask "Install the *rust* toolchain?" && install_rust
ask "Install the *javascript* toolchain?" && install_javascript
ask "Install the *ocaml* toolchain?" && package_install ocaml utop
ask "Install *tmux* the terminal multiplexer?" && package_install tmux
ask "Install *fzf* for fuzzy finding and shell completion?" && install_fzf
ask "Install *vim-plug*, a simple vim plugin manager?" && install_vim_plug
ask "Install *tldr* to explain common usages of commands?" && install_tldr
ask "Install *jq* to edit json?" && package_install jq
ask "Install *tree* to display a filetree?" && package_install tree
ask "Install *tig* to interactively view the git history?" && package_install tig
ask "Install *htop* to interatively view processes?" && package_install htop
ask "Install *netcat* to interact with tcp/udp sockets?" && install_netcat
