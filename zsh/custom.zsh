# clear history in tmux session
clear_history(){
    clear
    if [[ -n "$TMUX" ]]; then
        tmux clear-history
    fi
}