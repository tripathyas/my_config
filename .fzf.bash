# Setup fzf
# ---------
if [[ ! "$PATH" == *~/.vim/plugged/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}~/.vim/plugged/fzf/bin"
fi

# Auto-completion
# ---------------
# [[ $- == *i* ]] && source "/Users/tripathyas/.config/my_config/.vim_runtime/my_plugins/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
# source "/Users/tripathyas/.config/my_config/.vim_runtime/my_plugins/fzf/shell/key-bindings.bash"
