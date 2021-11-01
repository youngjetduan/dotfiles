alias ci='conda install'
alias cs='conda search'
alias cl='conda list'
alias mi='mamba install'
alias ms='mamba search'
alias ml='mamba list'
alias ca='conda activate'
alias cda='conda deactivate'

alias pyvv='pyenv virtualenv'
alias pyvs='pyenv virtualenvs'
alias pya='pyenv activate'
alias pyd='pyenv deactivate'

alias git_mirror='git config --global url."https://hub.fastgit.org".insteadOf https://github.com'
alias git_unset='git config --global --unset url.https://hub.fastgit.org.insteadof'

if [[ "$OSTYPE" =~ ^darwin ]]; then
    alias vnc16='autossh -M 20016 -fNL 30016:192.168.2.16:5993 jumper624'
    alias vnc23='autossh -M 20023 -fNL 30023:192.168.2.23:3389 jumper624'
    alias vnc27='autossh -M 20027 -fNL 30027:192.168.1.101:5993 jumper323'
    alias vnc33='autossh -M 20033 -fNL 30033:192.168.1.106:5937 jumper323'
elif [[ "$OSTYPE" =~ ^linux ]]; then
    alias tb='tensorboard --logdir'
fi

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
    if [ "$TERM_PROGRAM" = "tmux" ]; then
        tmux clear-history
    fi
}
