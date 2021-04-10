#!/bin/bash

mkdir -p ~/.config/nvim
mkdir -p ~/.vim/after/ftplugin/

ln -sf ~/.config/my_config/.ackrc ~/.ackrc
ln -sf ~/.config/my_config/.bashrc ~/.bashrc
ln -sf ~/.config/my_config/.gitconfig ~/.gitconfig
ln -sf ~/.config/my_config/.gitignore ~/.gitignore
ln -sf ~/.config/my_config/.ignore ~/.ignore
ln -sf ~/.config/my_config/.zshrc ~/.zshrc
ln -sf ~/.config/my_config/.vimrc ~/.vimrc
ln -sf ~/.config/my_config/init.vim ~/.config/nvim/init.vim
ln -sf ~/.config/my_config/.tmux.conf ~/.tmux.conf
ln -sf ~/.config/my_config/.fzf.bash ~/.fzf.bash
ln -sf ~/.config/my_config/.fzf.zsh ~/.fzf.zsh
ln -sf ~/.config/my_config/.rgignore ~/.rgignore

for file in ~/.config/my_config/filetype/*; do
  ln -sf $file ~/.vim/after/ftplugin/$(basename $file)
done

if [ "$(uname)" == "Darwin" ]; then
  # Do something under Mac OS X platform
  echo
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  # Do something under GNU/Linux platform
  echo "Extracting nvim"
  ./nvim.appimage --appimage-extract
  sudo ln -sf ~/.config/my_config/squashfs-root/usr/bin/nvim /usr/bin/nvim
fi

[ -f ~/.vim/autoload/plug.vim ] || echo "Install plug" $(curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim)
vim -c 'PlugInstall' -c 'qa'


[[ -d ~/.tmux/plugins/tpm ]] || git clone --depth=1 --no-single-branch  https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
