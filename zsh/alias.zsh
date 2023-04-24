# conda
echo "set alias for conda command"
alias ci='conda install'
alias cs='conda search'
alias cl='conda list'
alias mi='mamba install'
alias ms='mamba search'
alias ml='mamba list'
alias ca='conda activate'
alias cda='conda deactivate'

# pyenv
echo "set alias for pyenv command"
alias pyvv='pyenv virtualenv'
alias pyvs='pyenv virtualenvs'
alias pya='pyenv activate'
alias pyd='pyenv deactivate'

# vnc
echo "set alias for vnc command"
if [[ "$OSTYPE" =~ ^darwin ]]; then
    alias vnc16='autossh -M 20016 -fNL 30016:192.168.2.16:5993 jumper624'
    alias vnc23='autossh -M 20023 -fNL 30023:192.168.2.23:3389 jumper624'
    alias vnc27='autossh -M 20027 -fNL 30027:127.0.0.1:5991 med27'
    alias vnc33='autossh -M 20033 -fNL 30033:192.168.2.144:5937 jumper624'
    alias vncqd='autossh -M 20048 -fNL 30048:127.0.0.1:5993 qingd'
    alias vncqd01='autossh -M 20041 -fNL 30041:127.0.0.1:5993 qingd01'
    alias vnc157='autossh -M 20218 -fNL 30218:192.168.2.218:3389 jumper624'
elif [[ "$OSTYPE" =~ ^linux ]]; then
    alias tb='tensorboard --logdir'
fi

# tmux
echo "set alias for tmux command"
alias tn='tmux new -s'
alias ta='tmux a -t'
alias tk='tmux kill-session -t'
alias tl='tmux ls'

# linux command
echo "set alias for linux system command"
alias ll='ls -alF'
alias la='ls -a'
alias ..='cd ..'
alias ...='cd ../..'
alias e='exit'
alias cls=clear_history

clear_history(){
    clear
    if [[ -n "$TMUX" ]]; then
        tmux clear-history
    fi
}

# proxy
echo "set alias for proxy command"
alias git_mirror='git config --global url."https://gitclone.com/github.com".insteadOf https://github.com'
alias git_unset='git config --global --unset url.https://gitclone.com/github.com.insteadof'

if [[ "$OSTYPE" =~ ^darwin ]]; then
    alias proxy_on='export all_proxy=socks5://127.0.0.1:7890'
    alias proxy_off='unset all_proxy'
fi
