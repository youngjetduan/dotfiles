# tmux
# echo "set alias for tmux command"
alias tn='tmux new -s'
alias ta='tmux a -t'
alias tk='tmux kill-session -t'
alias tl='tmux ls'

# linux command
# echo "set alias for linux system command"
alias ll='ls -alF'
alias la='ls -a'
alias ..='cd ..'
alias ...='cd ../..'
alias e='exit'
alias cls=clear_history

# set and unset proxy
if [[ "$OSTYPE" =~ ^darwin ]]; then
    alias set_proxy='export all_proxy=socks5://127.0.0.1:7890'
    alias unset_proxy='unset all_proxy'
fi
