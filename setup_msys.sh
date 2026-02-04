#!/usr/bin/env bash

safely_insert_dotfile .gitconfig
safely_insert_dotfile .bashrc
ln -sf $script_dir/.bashrc_msys ~/.bash/.bashrc_os
safely_insert_dotfile .tmux.conf
safely_insert_dotfile .vimrc
insert_dotfile .alias
insert_dotfile .lesskey

# Add bin to PATH
cat > ~/.config/path.sh << EOF
PATH=$script_dir/bin:$script_scripts/bin:\$PATH
EOF
