#!/bin/usr/env bash

if [[ -z $script_dir ]]; then
	echo 'Script should not be run on its own. Call "setup.sh".'
	exit 1
fi

mkdir -p .vim
insert_dotfile .vim/mac.vim .vim/os.vim
