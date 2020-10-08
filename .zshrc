##############################################################################
# History Configuration
##############################################################################
HISTSIZE=10000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=10000               #Number of history entries to save to disk
#HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ -s /Users/tripathyas/.autojump/etc/profile.d/autojump.sh ]] && source /Users/tripathyas/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u
export MANPAGER='nvim +Man!'


