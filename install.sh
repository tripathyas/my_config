which apt;
if [ $? -eq 0 ]; then
    mgr='apt-get'
else
    mgr='yum'
fi

echo sudo $mgr update;
echo sudo $mgr install -y fzf neovim ripgrep python3-pip pylint python3-autopep8 tmux autojump ctags cscope tldr;
sudo $mgr update;
sudo $mgr install -y fzf neovim ripgrep python3-pip pylint python3-autopep8 tmux autojump ctags cscope tldr;

if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform        
    echo 
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under GNU/Linux platform
    sudo ln -sf ~/.config/my_config/squashfs-root/usr/bin/nvim /usr/bin/nvim
fi
