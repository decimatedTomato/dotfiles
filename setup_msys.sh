#!/usr/bin/env bash

insert_dotfile .gitconfig
insert_dotfile .bashrc
mv ~/.bashrc ~/.bash/bashrc.main
ln -s $script_dir/.bashrc_msys ~/.bashrc
insert_dotfile .tmux.conf
insert_dotfile .vimrc
