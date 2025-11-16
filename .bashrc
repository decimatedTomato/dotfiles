# Only run for interactive shells
case $- in
	*i*) ;;
	*) return;;
esac
########################### ENVIRONMENT VARIABLES ##############################
export HISTSIZE=-1
export HISTFILESIZE=-1
export LESS='-j 2 --mouse --wheel-lines 2'
export EDITOR=vim
################################### SETTINGS ###################################
shopt -s histappend
################################################################################

source ~/.alias

[ -f ~/.config/fzf/fzf.bash ] && source ~/.config/fzf/fzf.bash
[ -f ~/git/fzf-git/fzf-git.sh ]  && source ~/git/fzf-git/fzf-git.sh

[ -f ~/.bashrc_local ] && source ~/.bashrc_local
