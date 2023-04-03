# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

#Initialize plugin manager
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

antidote load

#Aliases
alias ls='ls --color=auto'
alias ll="ls -l"
alias la='ls -a'
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias lsblk="lsblk -o name,mountpoint,label,size,uuid"
alias emacs="emacs -nw"
alias rice="/usr/bin/git --git-dir=$HOME/.src/ricefields.git --work-tree=$HOME"
alias lsblk="lsblk -f"
alias sudo="sudo "

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# Autoload comp files in system
autoload -Uz compinit
compinit -u
