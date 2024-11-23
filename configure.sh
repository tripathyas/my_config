#!/bin/bash

# mkdir -p ~/.config
# mkdir -p ~/.vim/after/ftplugin/
# 
# ln -sf ~/my_config/.ackrc ~/.ackrc
# ln -sf ~/my_config/.bashrc ~/.bashrc
# ln -sf ~/my_config/.gitconfig ~/.gitconfig
# ln -sf ~/my_config/.gitignore ~/.gitignore
# ln -sf ~/my_config/.ignore ~/.ignore
# ln -sf ~/my_config/.zshrc ~/.zshrc
# ln -sf ~/my_config/.tmux.conf ~/.tmux.conf
# ln -sf ~/my_config/.fzf.bash ~/.fzf.bash
# ln -sf ~/my_config/.fzf.zsh ~/.fzf.zsh
# ln -sf ~/my_config/.rgignore ~/.rgignore
# ln -sf ~/my_config/nvim ~/.config/nvim
# ln -sf ~/.config/my_config/init.vim ~/.config/nvim/init.vim
# ln -sf ~/repo/private/my_config/.vimrc ~/.vimrc
mkdir -p ~/repo/personal/
cd ~/repo/personal && git clone --depth=1 --no-single-branch https://github.com/tripathyas/my_config.git && cd ~/repo/personal/my_config && git checkout v2
mkdir -p ~/.config/
ln -sf ~/repo/personal/my_config/nvim ~/.config/
ln -sf ~/repo/personal/my_config/.tmux.conf ~/.tmux.conf

mkdir ~/packages && cd ~/packages
wget  https://github.com/neovim/neovim/releases/download/v0.10.2/nvim-linux64.tar.gz && tar xzvf nvim-linux64.tar.gz && ./nvim-linux64/bin/nvim

sudo ln -sf ~/packages/nvim-linux64/bin/nvim /usr/bin/nvim


mkdir -p ~/repo/public/
cd ~/repo/public/ && git clone --depth=1 https://github.com/wting/autojump.git && cd autojump && ./install.py

mkdir -p ~/packages/ack && cd ~/packages/ack
curl https://beyondgrep.com/ack-v3.7.0 > ack && chmod 0755 ack
sudo ln -sf ~/packages/ack/ack /usr/bin/ack
# [ -f ~/.vim/autoload/plug.vim ] || echo "Install plug" $(curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim) 
# vim -c 'PlugInstall' -c 'qa'
# nvim -c 'PlugInstall' -c 'qa'


# LOCAL SYSTEM SETUP

for file in ~/.config/my_config/filetype/*; do
  ln -sf $file ~/.vim/after/ftplugin/$(basename $file)
done

# if [ "$(uname)" == "Darwin" ]; then
#   # Do something under Mac OS X platform
#   echo
# elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
#   # Do something under GNU/Linux platform
#   echo "Extracting nvim"
#   ./nvim.appimage --appimage-extract
#   sudo ln -sf ~/repo/private/my_config/squashfs-root/usr/bin/nvim /usr/bin/nvim
# fi


# [[ -d ~/.tmux/plugins/tpm ]] || git clone --depth=1 --no-single-branch  https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# create cron job to update repo after reboot
# (crontab -l ; echo "@reboot sleep 10 && git -C ~/repo/private/my_config pull >/dev/null 2>&1") | sort - | uniq - | crontab -
