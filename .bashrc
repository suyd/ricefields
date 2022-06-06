#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll="ls -l"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias lsblk="lsblk -o name,mountpoint,label,size,uuid"
alias emacs="emacs -nw"
alias rice="/usr/bin/git --git-dir=$HOME/.src/ricefields.git --work-tree=$HOME"

PS1='[\u@\h \W]\$ '
