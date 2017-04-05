#
# show a customized prompt symbol + an status bar
# TODO: a less hacky solution for displaying status bar? :\
#

PROMPT="%(?.%F{green}.%F{9})❯%f " # symbol in green/red

precmd() { 
    print -Pn "\033[s\033[1;1H%E%F{magenta}[%~]%f\033[u"
}


__status-init() {
    print -Pn "\n"
}
__status-ctrl-l() {
    zle && zle kill-buffer && zle -R
    clear
    precmd
    print -Pn "\n$PROMPT"
}
__status-clear() {
    clear
    precmd
    print -Pn "$PROMPT"
}

zle -N __status-ctrl-l
bindkey "^L" __status-ctrl-l
alias clear=__status-clear
__status-init

# TODO: jobs + git info
