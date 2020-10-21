# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/tripathyas/.config/my_config/.vim_runtime/my_plugins/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/tripathyas/.config/my_config/.vim_runtime/my_plugins/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/tripathyas/.config/my_config/.vim_runtime/my_plugins/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/tripathyas/.config/my_config/.vim_runtime/my_plugins/fzf/shell/key-bindings.bash"
