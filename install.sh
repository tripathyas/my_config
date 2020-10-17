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

