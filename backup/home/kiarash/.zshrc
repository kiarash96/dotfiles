#
# ~/.zshrc
#

# Load antigen
source /usr/share/zsh/scripts/antigen/antigen.zsh

# Load oh-my-zsh library
antigen use oh-my-zsh

# Load selected bundles
antigen bundle git
antigen bundle virtualenv

# bullet-train theme
antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train

# Finish!
antigen apply

# Include ruby gems in path
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

# User ssh-agent service
export SSH_AUTH_SOCK="/tmp/kiarash/ssh-agent.socket"

# Set default text editor
export VISUAL=vim
export EDITOR=vim

# For colored man pages
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

