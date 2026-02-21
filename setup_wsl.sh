#!/usr/bin/env bash

if [[ -z $script_dir ]]; then
	echo 'Script should not be run on its own. Call "setup.sh".'
	exit 1
fi

mkdir -p ~/.bash
insert_dotfile .bashrc_wsl .bash/.bashrc_os
insert_dotfile .vim/windows.vim .vim/os.vim

