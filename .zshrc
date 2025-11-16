# Only run for interactive shells
case $- in
	*i*) ;;
	*) return;;
esac
########################### ENVIRONMENT VARIABLES ##############################
export HISTSIZE=100000
export SAVEHIST=100000
export LESS='-j 2 --mouse --wheel-lines 2'
############################## SHELL VARIABLES #################################
EDITOR=vim
################################### SETTINGS ###################################
setopt EXTENDED_HISTORY
################################################################################

source ~/.alias

[ -f ~/.config/fzf/fzf.zsh ] && source ~/.config/fzf/fzf.zsh
[ -f ~/git/fzf-git/fzf-git.sh ]  && source ~/git/fzf-git/fzf-git.sh

[ -f ~/.zshrc_local ] && source ~/.zshrc_local
