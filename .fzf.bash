# Setup fzf
# ---------
if [[ ! "$PATH" == ~/.vim_runtime/my_plugins/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}~/.vim_runtime/my_plugins/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "~/.vim_runtime/my_plugins/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.vim_runtime/my_plugins/fzf/shell/key-bindings.bash"
