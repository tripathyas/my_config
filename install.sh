#!/bin/bash

#-------------------start_usage---------------------
:'
[[ -d ~/.config/my_config ]] && git -C ~/.config/my_config pull
[[ -d ~/.config/my_config ]] || git clone --depth=1 https://github.com/ashutosh-tripathy/my_config.git ~/.config/my_config
cd ~/.config/my_config && sudo ./install.sh && ./configure.sh
'
#-------------------end_usage---------------------

# which apt
# if [ $? -eq 0 ]; then
#   mgr='apt-get'
# else
#   mgr='yum'
# fi
#
# echo sudo $mgr install -y fzf ripgrep autojump 
#
# echo sudo $mgr update
# echo sudo $mgr install -y fzf ripgrep python3-pip pylint tmux autojump ctags cscope tldr vim xmonad libghc-xmonad-contrib-dev dmenu
# sudo $mgr update
# sudo $mgr install -y git fzf ripgrep python3-pip pylint tmux autojump ctags cscope tldr vim xmonad libghc-xmonad-contrib-dev dmenu


# if [ "$(uname)" == "Darwin" ]; then
#   # Do something under Mac OS X platform
#   echo
# elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
#   # Do something under GNU/Linux platform
# fi

#sudo apt-get install -y git fzf ripgrep python3-pip pylint tmux autojump cscope tldr vim neovim exuberant-ctags curl
# sudo apt-get install -y git ripgrep pylint tmux autojump tldr neovim 
brew install git ripgrep pylint tmux autojump tldr neovim lua luarocks wget rust nodejs npm ack
cargo install stylua


sudo tdnf update
sudo tdnf install git ripgrep pylint tmux  lua  wget rust nodejs npm 
sudo tdnf install autojump tldr luarocks ack neovim

