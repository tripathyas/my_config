# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/tripathyas/.vim_runtime/my_plugins/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/tripathyas/.vim_runtime/my_plugins/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/tripathyas/.vim_runtime/my_plugins/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/tripathyas/.vim_runtime/my_plugins/fzf/shell/key-bindings.zsh"
