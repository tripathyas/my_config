#!/bin/bash

mkdir -p ~/.config
mkdir -p ~/.vim/after/ftplugin/

ln -sf ~/my_config/.ackrc ~/.ackrc
ln -sf ~/my_config/.bashrc ~/.bashrc
ln -sf ~/my_config/.gitconfig ~/.gitconfig
ln -sf ~/my_config/.gitignore ~/.gitignore
ln -sf ~/my_config/.ignore ~/.ignore
ln -sf ~/my_config/.zshrc ~/.zshrc
ln -sf ~/my_config/.tmux.conf ~/.tmux.conf
ln -sf ~/my_config/.fzf.bash ~/.fzf.bash
ln -sf ~/my_config/.fzf.zsh ~/.fzf.zsh
ln -sf ~/my_config/.rgignore ~/.rgignore
ln -sf ~/my_config/nvim ~/.config/nvim
# ln -sf ~/.config/my_config/init.vim ~/.config/nvim/init.vim
# ln -sf ~/repo/private/my_config/.vimrc ~/.vimrc

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

apt install unzip
sudo apt install go
go install -v golang.org/x/tools/gopls@latest
