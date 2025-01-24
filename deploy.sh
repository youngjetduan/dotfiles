#! /bin/sh
BASE_DIR=`pwd`
TODAY=`date +%Y%m%d%H%M%S`

usage() {
    echo "Usage: $0 [options]"  
    echo "Options:"  
    echo "    --skip        action1, action2, action3   Skip executing specified actions (comma-separated)"
    echo "    -h, --help                                Show this help message"
}

# 初始化条件变量  
SKIP_GIT=false
SKIP_P10K=false
SKIP_PIP=false
SKIP_CONDA=false

# 处理输入参数  
for arg in "$@"; do  
    case $arg in  
        --skip)
            IFS=',' read -ra ACTIONS <<< "$2"   # 解析逗号分隔的动作  
            for action in "${ACTIONS[@]}"; do  
                case $action in  
                    "git")  
                        SKIP_GIT=true  
                        ;;  
                    "p10k")  
                        SKIP_P10K=true  
                        ;;  
                    "pip")  
                        SKIP_PIP=true  
                        ;;  
                    "conda")  
                        SKIP_CONDA=true  
                        ;;  
                    *)  
                        echo "Unknown action: $action"  
                        usage  
                        exit 1  
                        ;;  
                esac  
            done  
            shift 2   # 移动到下一个参数  
            ;;  
        -h|--help)  
            usage  
            exit 0  
            ;;  
        *)  
            echo "Unknown option: $arg"  
            usage  
            exit 1  
            ;;  
    esac  
done

#建立zshrc链接
echo "配置zsh..."
for i in $HOME/.zshrc
do
  [ -L $i ] && unlink $i
  [ -e $i ] && mv $i $i.bak
done
ln -s $BASE_DIR/zsh/zshrc $HOME/.zshrc

#建立tmux配置链接
echo "配置tmux..."
if [ -L $HOME/.tmux.conf ];then
    unlink $HOME/.tmux.conf
elif [ -f $HOME/.tmux.conf ];then
    mv $HOME/.tmux.conf $HOME/.tmux.conf.bak
fi
ln -s $BASE_DIR/tmux/tmux.conf $HOME/.tmux.conf

#建立gitconfig链接
if [ "$SKIP_GIT" == false ]; then
    echo "配置Git..."
    if [ -L $HOME/.gitconfig ];then
        unlink $HOME/.gitconfig
    elif [ -f $HOME/.gitconfig ];then
        mv $HOME/.gitconfig $HOME/.gitconfig.$TODAY
    fi
    ln -s $BASE_DIR/git/gitconfig $HOME/.gitconfig
fi

#建立conda配置链接
if [ "$SKIP_CONDA" == false ]; then
    echo "配置conda"
    if [ -L $HOME/.condarc ];then
        unlink $HOME/.condarc
    elif [ -f $HOME/.condarc ];then
        mv $HOME/.condarc $HOME/.condarc.bak
    fi
    if [[ "$OSTYPE" =~ ^darwin ]]; then
        ln -s $BASE_DIR/conda/condarc_darwin $HOME/.condarc
    elif [[ "$OSTYPE" =~ ^linux ]]; then
        ln -s $BASE_DIR/conda/condarc_linux $HOME/.condarc
    fi
fi

if [ "$SKIP_PIP" == false ]; then
    echo "配置pip"
    if [ ! -d $HOME/.pip ]; then
        mkdir $HOME/.pip
    fi
    if [ -L $HOME/.pip/pip.conf ]; then
        unlink $HOME/.pip/pip.conf
    elif [ -f $HOME/.pip/pip.conf ]; then
        mv $HOME/.pip/pip.conf $HOME/.pip/pip.conf.bak
    fi
    ln -s $BASE_DIR/pip/pip.conf $HOME/.pip/pip.conf
fi

#建立p10k配置链接
if [ "$SKIP_P10K" == false ]; then
    echo "配置p10k..."
    if [ -L $HOME/.p10k.zsh ];then
        unlink $HOME/.p10k.zsh
    elif [ -f $HOME/.p10k.zsh ];then
        mv $HOME/.p10k.zsh $HOME/.p10k.zsh.bak
    fi
    ln -s $BASE_DIR/zsh/p10k.zsh $HOME/.p10k.zsh
    echo "Config completed, just enjoy!"
fi