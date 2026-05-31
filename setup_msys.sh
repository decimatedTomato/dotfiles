#!/usr/bin/env bash

if [[ -z $script_dir ]]; then
	echo 'Script should not be run on its own. Call "setup.sh".'
	exit 1
fi

install_fzf() {
	local fzf_dir=~/git/fzf
	mkdir -p "$fzf_dir"
	git clone --depth 1 git@github.com:decimatedTomato/fzf.git "$fzf_dir"
	"${fzf_dir}/install" --xdg --key-bindings --completion --no-update-rc --no-fish --no-zsh
	local fzf_git_dir=~/git/fzf-git
	mkdir -p "$fzf_git_dir"
	git clone --depth 1 git@github.com:decimatedTomato/fzf-git.sh.git "$fzf_git_dir"

}

insert_dotfile .gitconfig
insert_dotfile .bashrc
mkdir -p ~/.bash
insert_dotfile .bashrc_msys .bash/.bashrc_os
insert_dotfile .tmux.conf
insert_dotfile .vimrc
insert_dotfile .alias
insert_dotfile .lesskey

# Add bin to PATH
cat > ~/.config/path.sh << EOF
PATH=$script_dir/bin:$script_scripts/bin:\$PATH
EOF

command -v fzf >/dev/null || (ask "Install *fzf* for fuzzy finding and shell completion?" && install_fzf)

