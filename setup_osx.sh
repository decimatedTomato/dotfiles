#!/usr/bin/env zsh


install_brew() {
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

install_rust() {
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
}

install_javascript() {
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | sh
	\. "$HOME/.nvm/nvm.sh"
	nvm install 24
}

install_fzf() {
	local fzf_dir=~/git/fzf
	mkdir -p $fzf_dir
	git clone --depth 1 --branch v0.66.1 \
		https://github.com/junegunn/fzf.git $fzf_dir
	$fzf_dir/install --xdg --key-bindings --completion --no-update-rc --no-fish
	local fzf_git_dir=~/git/fzf-git
	mkdir -p $fzf_git_dir
	git clone --depth 1 https://github.com/junegunn/fzf-git.sh.git $fzf_git_dir
}

install_vim_plug() {
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	sh -c 'curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

install_karabiner() {
	brew install --cask karabiner-elements
	echo 'Go ahead and allow karabiner-elements to run in the background by your login items'
	read -r
}

install_xquartz() {
	brew install --cask xquartz
	echo 'Go ahead and allow xquartz to run in the background by your login items'
	read -r
}

intall_raycast() {
	brew install --cask raycast
	echo 'Go ahead and add raycast to "Open at Login" by your login items'
	read -r
}

install_scroll_reverser() {
	brew install --cask scroll-reverser
	echo 'Go ahead and add scroll-reverser to "Open at Login" by your login items'
	read -r
}

safely_insert_dotfile .gitconfig
safely_insert_dotfile .bashrc
safely_insert_dotfile .zshrc
safely_insert_dotfile .tmux.conf
safely_insert_dotfile .vimrc
safely_insert_dotfile .config/nvim
insert_dotfile .alias

ask "Do you wish to install the package manager brew?" && install_brew \
	|| echo 'Then we are done here' && exit 0

ask "Install the *rust* toolchain?" && install_rust
ask "Install the *javascript* toolchain?" && install_javascript
ask "Install the *ocaml* toolchain?" && brew install ocaml utop

ask "Install *tmux* the terminal multiplexer?" && brew install tmux
ask "Install *neovim* the text editor?" && brew install nvim

ask "Install *fzf* for fuzzy finding and shell completion?" && install_fzf
ask "Install *vim-plug*, a simple vim plugin manager?" && install_vim_plug
ask "Install *tldr* to explain common usages of commands?" && brew install tldr
ask "Install *jq* to edit json?" && brew install jq
ask "Install *tree* to display a filetree?" && brew install tree
ask "Install *tig* to interactively view the git history?" && brew install tig
ask "Install *htop* to interatively view processes?" && brew install htop
ask "Install *netcat* to interact with tcp/udp sockets?" && brew install netcat

ask "Install *karabiner*, the keyboard customizer?" && install_karabiner
ask "Install *xquartz* the X window server?" && install_xquartz
ask "Install *raycast* for custom keybinds?" && install_raycast
ask "Install *scroll-reverser* in order to scroll normally?" && install_scroll_reverser
