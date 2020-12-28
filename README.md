## About

此仓库存放的是一些linux常用的配置文件， 通过软链接建立与系统配置文件的联系（系统的相关配置文件通过软链接指向该仓库中的文件). 如 `~/.zshrc` -> `repo_path/zsh/zshrc`.

当前分支为 **Mac** 分支, OSX 配置另见 [ubuntu](https://github.com/keyunj/dotfiles/tree/ubuntu) 分支.

## Install

1. 克隆本仓库至本地用户目录下
   
   1. 克隆完整仓库，之后切换至mac分支
   
   ```shell
   git clone git@github.com:keyunj/dotfiles.git
   cd dotfiles
   git checkout mac
   ```
   
   2. 仅克隆mac分支
   
   ```shell
   git clone -b mac git@github.com:keyunj/dotfiles.git
   ```
   
2. 运行配置脚本

``` shell
sh mac.sh
```

## More

获取`dotfiles`的更多信息，可以访问 http://dotfiles.github.io/