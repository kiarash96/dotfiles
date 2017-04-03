#
# ~/.config/zsh/.zshrc
#

# zsh completion engine
autoload -U compinit
compinit
zstyle ':completion:*' menu select # enable navigation in autocomplete menu

# default prompt
autoload -U promptinit
promptinit
prompt redhat

# vim style line editor
bindkey -v

# fix delete and backspace
bindkey '^[[P' delete-char
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char

# rupa/z
_Z_CMD=j

# load zgen plugin manager
ZGEN_INIT=$ZDOTDIR/.zgeninit
source "$ZDOTDIR/zgen/zgen.zsh"
if ! zgen saved; then
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-history-substring-search
    zgen load zsh-users/zsh-autosuggestions

    zgen load rupa/z

    # generate static init script
    zgen save
fi

# zsh-syntax-highlighting plugin
ZSH_HIGHLIGHT_STYLES[globbing]='fg=yellow'
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
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# zsh-autosuggestions plugin
bindkey '^ ' autosuggest-accept

# Command aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'

