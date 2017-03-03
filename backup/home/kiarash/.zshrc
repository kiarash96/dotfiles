#
# ~/.zshrc
#

# Load antigen
source /usr/share/zsh/scripts/antigen/antigen.zsh

# Load oh-my-zsh library
antigen use oh-my-zsh

# Load selected bundles
antigen bundle git
#antigen bundle vi-mode
antigen bundle virtualenv

# External bundles
antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle zsh-users/zsh-history-substring-search
# vim mode keys
#bindkey -M vicmd 'k' history-substring-search-up
#bindkey -M vicmd 'j' history-substring-search-down
# normal mode keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down


antigen bundle zsh-users/zsh-autosuggestions
bindkey '^ ' autosuggest-accept


# bullet-train theme
BULLETTRAIN_DIR_EXTENDED=1
antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train

# Finish!
antigen apply

# Include ruby gems in path
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

# Make bundler install gems per user by default
export GEM_HOME=$(ruby -e 'print Gem.user_dir')

# rupa/z
_Z_CMD=j
source /usr/lib/z.sh

# User ssh-agent service
export SSH_AUTH_SOCK="/tmp/kiarash/ssh-agent.socket"

# Set default text editor
export VISUAL=vim
export EDITOR=vim
export DIFFPROG=vim

# History settings
HISTFILE="$HOME/.zhistory"
HISTSIZE=10000000
SAVEHIST=10000000

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
#setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
#setopt HIST_BEEP                 # Beep when accessing nonexistent history.

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

