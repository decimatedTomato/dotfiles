#!/usr/bin/env bash

mkdir -p ~/.bash
ln -sf $script_dir/.bashrc_wsl ~/.bash/.bashrc_os
insert_dotfile .vim/windows.vim
