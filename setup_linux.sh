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
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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
		echo 'sudo zypper install -y'
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

safely_insert_dotfile .gitconfig
safely_insert_dotfile .bashrc
safely_insert_dotfile .tmux.conf
safely_insert_dotfile .vimrc
insert_dotfile .alias
insert_dotfile .lesskey

# Add bin to PATH
cat > ~/.config/path.sh << EOF
PATH=$script_dir/bin:$script_dir/scripts:\$PATH
EOF

command -v curl >/dev/null || (ask "Install *curl* to make network requests?" && package_install curl)
all_installed gcc clang make cmake g++ clang++ \
	|| (ask "Install some *c* toolchain stuff?" && install_c)
all_installed rustup cargo rustc \
	|| (ask "Install the *rust* toolchain?" && install_rust)
all_installed nvm node npm \
	|| (ask "Install the *javascript* toolchain?" && install_javascript)
command -v ocaml >/dev/null || (ask "Install the *ocaml* toolchain?" && package_install ocaml)
command -v tmux >/dev/null || (ask "Install *tmux* the terminal multiplexer?" && package_install tmux)
command -v fzf >/dev/null || (ask "Install *fzf* for fuzzy finding and shell completion?" && install_fzf)
[[ -f .vim/autoload/plug.vim ]] \
	|| (ask "Install *vim-plug*, a simple vim plugin manager?" && install_vim_plug)
command -v tldr >/dev/null || (ask "Install *tldr* to explain common usages of commands?" && install_tldr)
command -v jq >/dev/null || (ask "Install *jq* to edit json?" && package_install jq)
command -v tree >/dev/null || (ask "Install *tree* to display a filetree?" && package_install tree)
command -v tig >/dev/null || (ask "Install *tig* to interactively view the git history?" && package_install tig)
command -v htop >/dev/null || (ask "Install *htop* to interatively view processes?" && package_install htop)
command -v nc >/dev/null || (ask "Install *netcat* to interact with tcp/udp sockets?" && install_netcat)

