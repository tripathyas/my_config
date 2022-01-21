##############################################################################
# History Configuration
##############################################################################
HISTSIZE=10000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=20000               #Number of history entries to save to disk
HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -d ~/.config/my_config ] && PATH=$PATH:~/.config/my_config/scripts/
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh

if [ -x "$(command -v nvim)" ]; then
    nvim='nvim'
else
    nvim='vim'
fi

# command completion
autoload -U compinit && compinit -u
export MANPAGER="${nvim} +Man!"

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

[ -f ~/.config/my_config/shrc.sh ] && source ~/.config/my_config/shrc.sh 
alias sshx='ssh -o "ServerAliveInterval 60"  -o "ServerAliveCountMax 120" '
