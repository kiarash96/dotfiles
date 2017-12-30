#
# ~/.config/zsh/.zshrc
#

# zsh completion engine
autoload -U compinit
compinit
zstyle ':completion:*' menu select # enable navigation in autocomplete menu
zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*' # case insensitive (all), partial-word and substring completion
zstyle ':completion:*' list-colors '' # color in completion menu

# misc options
setopt correct # suggest correction for commands
setopt notify # Report the status of backgrounds jobs immediately

# emacs style line editor
bindkey -e

bindkey "$terminfo[khome]" beginning-of-line # Home
bindkey "$terminfo[kend]" end-of-line # End
bindkey "$terminfo[kich1]" overwrite-mode # Insert
bindkey "$terminfo[kdch1]" delete-char # Delete
bindkey "$terminfo[kcuu1]" up-line-or-history # Up
bindkey "$terminfo[kcud1]" down-line-or-history # Down
bindkey "$terminfo[kcub1]" backward-char # Left
bindkey "$terminfo[kcuf1]" forward-char # Right
# bindkey "$terminfo[kpp]" # PageUp
# bindkey "$terminfo[knp]" # PageDown

# Bind ctrl-left / ctrl-right
bindkey "\e[1;5D" backward-word
bindkey "\e[1;5C" forward-word

# load zgen plugin manager
source "${HOME}/.zgen/zgen.zsh"
if ! zgen saved; then
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-history-substring-search
    zgen load zsh-users/zsh-autosuggestions

    # generate static init script
    zgen save
fi

# zsh-syntax-highlighting plugin
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[path]='none'

# History and zsh-history-substring-search plugin
HISTFILE="$ZDOTDIR/.zhistory"
HISTSIZE=10000000
SAVEHIST=10000000
setopt SHARE_HISTORY            # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST   # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS         # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS     # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS        # Do not display a line previously found.
setopt HIST_SAVE_NO_DUPS        # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS       # Remove superfluous blanks before recording entry.
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# zsh-autosuggestions plugin
bindkey '^ ' autosuggest-accept

# my custom prompt

autoload -U colors && colors

if [ $EUID -lt 1000 ]; then
    local _usercolor="$fg_bold[red]"
else
    local _usercolor="$fg[cyan]"
fi

local _hostcolor="$fg[default]"
local _who="%{$_hostcolor%}[%{$_usercolor%}%n%{$reset_color$_hostcolor%}@%M]%{$reset_color%}"

local _path="%{$fg[magenta]%}[%1~]%{$reset_color%}"
local _prompt="%(?.%{$fg[green]%}.%{$fg[red]%})❯ %{$reset_color%}"

PROMPT="$_who $_path $_prompt"

# Command aliases

alias ls='command ls -F --color=auto --group-directories-first'
alias grep='command grep --color=auto'

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}
