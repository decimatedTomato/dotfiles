#!/usr/bin/env bash

if [[ -z $script_dir ]]; then
	echo 'Script should not be run on its own. Call "setup.sh".'
	exit 1
fi

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
