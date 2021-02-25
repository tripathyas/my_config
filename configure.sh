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
ln -sf ~/.config/my_config/tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/.config/my_config/tmux/.tmux.conf.local ~/.tmux.conf.local
ln -sf ~/.config/my_config/.fzf.bash ~/.fzf.bash
ln -sf ~/.config/my_config/.fzf.zsh ~/.fzf.zsh
ln -sf ~/.config/my_config/.rgignore ~/.rgignore

for file in ~/.config/my_config/vim_runtime/vimrcs/filetype/*; do
  ln -sf $file ~/.vim/after/ftplugin/$(basename $file)
done

if [ "$(uname)" == "Darwin" ]; then
  # Do something under Mac OS X platform
  echo
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  # Do something under GNU/Linux platform
  echo "Extracting nvim"
  ./nvim.appimage --appimage-extract
fi

[ -f ~/.vim/autoload/plug.vim ] || echo "Installed plug" $(curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim)

#./vim_runtime/my_plugins/fzf/install
#git submodule update --init --recursive
#python3 ./vim_runtime/my_plugins/YouCompleteMe/install.py --clangd-completer --go-completer --rust-completer --ts-completer
#ln -sf ~/.config/my_config/vim_runtime ~/.vim_runtime
