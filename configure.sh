mkdir -p ~/.config/nvim
ln -sf ~/.config/my_config/.ackrc ~/.ackrc
ln -sf ~/.config/my_config/.bashrc ~/.bashrc
ln -sf ~/.config/my_config/.gitconfig ~/.gitconfig
ln -sf ~/.config/my_config/.gitignore ~/.gitignore
ln -sf ~/.config/my_config/.ignore ~/.ignore
ln -sf ~/.config/my_config/.zshrc ~/.zshrc
ln -sf ~/.config/my_config/.vimrc ~/.vimrc
ln -sf ~/.config/my_config/.vim_runtime ~/.vim_runtime
ln -sf ~/.config/my_config/init.vim  ~/.config/nvim/init.vim
ln -sf ~/.config/my_config/.tmux/.tmux.conf  ~/.tmux.conf
ln -sf ~/.config/my_config/.fzf.bash  ~/.fzf.bash
ln -sf ~/.config/my_config/.fzf.zsh  ~/.fzf.zsh


./nvim.appimage --appimage-extract

git submodule update --init --recursive
python3 ./.vim_runtime/my_plugins/YouCompleteMe/install.py --clangd-completer --go-completer --rust-completer --ts-completer
./.vim_runtime/my_plugins/fzf/install
