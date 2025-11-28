#!/usr/bin/env bash

safely_insert_dotfile .gitconfig
safely_insert_dotfile .bashrc
mv ~/.bashrc ~/.bash/bashrc.main
ln -sf $script_dir/.bashrc_msys ~/.bashrc
safely_insert_dotfile .tmux.conf
safely_insert_dotfile .vimrc
ln -sf $script_dir/.alias ~/.alias

# Add bin to PATH
cat > ~/.config/path.sh << EOF
PATH=$script_dir/bin:$script_dir/bin:\$PATH
EOF
