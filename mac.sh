BASE_DIR=`pwd`
TODAY=`date +%Y%m%d%H%M%S`

#建立zshrc链接
echo "配置zsh..."
for i in $HOME/.zshrc
do
  [ -L $i ] && unlink $i
  [ -e $i ] && mv $i $i.bak
done
ln -s $BASE_DIR/zsh/zshrc $HOME/.zshrc

#建立gitconfig链接
echo "配置Git..."
if [ -L $HOME/.gitconfig ];then
    unlink $HOME/.gitconfig
elif [ -f $HOME/.gitconfig ];then
    mv $HOME/.gitconfig $HOME/.gitconfig.$TODAY
fi
ln -s $BASE_DIR/git/gitconfig $HOME/.gitconfig

echo "Config completed, just enjoy!"