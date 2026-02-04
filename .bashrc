# Only run for interactive shells
case $- in
	*i*) ;;
	*) return;;
esac
########################### ENVIRONMENT VARIABLES ##############################
export HISTSIZE=-1
export HISTFILESIZE=-1
export LESS='-R -j 3 --mouse --wheel-lines 2'
export EDITOR=vim
################################### SETTINGS ###################################
shopt -s histappend
shopt -s direxpand
################################################################################

[ -f ~/.config/path.sh ] && source ~/.config/path.sh
source ~/.alias

[ -f ~/.bashrc_local ] && source ~/.bashrc_local
[ -f ~/.bash/.bashrc_os ] && source ~/.bash/bashrc_os

[ -f ~/.config/fzf/fzf.bash ] && source ~/.config/fzf/fzf.bash
[ -f ~/git/fzf-git/fzf-git.sh ]  && source ~/git/fzf-git/fzf-git.sh

[ -f ~/.cargo/env ] && source "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

