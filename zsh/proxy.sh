if [[ "$OSTYPE" =~ ^darwin ]]; then
    alias proxy_on="export all_proxy=socks5://127.0.0.1:7890"
    alias proxy_off="unset all_proxy"
elif [[ "$OSTYPE" =~ ^linux ]]; then
    alias git_mirror='git config --global url."https://gitclone.com/github.com".insteadOf https://github.com'
    alias git_unset='git config --global --unset url.https://gitclone.com/github.com.insteadof'
fi
