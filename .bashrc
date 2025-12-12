#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.aliasrc

HISTSIZE=10000
HISTFILESIZE=10000
PS1='[\u@\h \W]\$ '
PATH="$PATH:/opt"

shopt -s histappend

export GPG_TTY=$(tty)
export EDITOR=vim
export VISUAL=vim
export SYSTEMD_EDITOR=vim
# unset DEBUGINFOD_URLS

gpg-connect-agent updatestartuptty /bye > /dev/null

bind -s 'set completion-ignore-case on'

PS1='\[\e[1;31m\][\[\e[1;33m\]\u\[\e[1;32m\]@\[\e[1;34m\]\h \[\e[1;35m\]\w\[\e[1;31m\]]\[\e[1;00m\]\$\[\e[0;00m\] '

eval "$(zoxide init bash)"
