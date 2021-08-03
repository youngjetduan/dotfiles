alias ci='conda install'
alias cs='conda search'
alias cl='conda list'
alias mi='mamba install'
alias ms='mamba search'
alias ml='mamba list'
alias ca='conda activate'
alias cda='conda deactivate'

alias tb='tensorboard --logdir'

alias tn='tmux new -s'
alias ta='tmux a -t'
alias tk='tmux kill-session -t'
alias tl='tmux ls'

alias ll='ls -alF'
alias la='ls -a'

alias ..='cd ..'
alias ...='cd ../..'
alias e='exit'
alias cls=clear_history


clear_history(){
    clear
    if ! { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
        tmux clear-history
    fi
}