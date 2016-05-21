#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

# user ssh-agent service
export SSH_AUTH_SOCK="/tmp/kiarash/ssh-agent.socket"

PS1='[\u@\h \W]\$ '

shopt -s checkwinsize

export VISUAL=vim
export EDITOR=vim

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# for colored man pages
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}
