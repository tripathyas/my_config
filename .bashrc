HISTSIZE=10000
HISTFILESIZE=20000
export HISTCONTROL=erasedups
shopt -s histappend

#Store Bash History Immediately
PROMPT_COMMAND='history -a'

if [ -x "$(command -v nvim)" ]; then
  nvim='nvim'
else
  nvim='vim'
fi

export VISUAL=vim
export EDITOR="$VISUAL"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -d ~/repo/private/my_config ] && PATH=$PATH:~/repo/private/my_config/scripts/
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh
[[ -s /usr/share/autojump/autojump.sh ]] && . /usr/share/autojump/autojump.sh

export MANPAGER="${nvim} +Man!"

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

[ -d "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

[ -f ~/.config/my_config/shrc.sh ] && source ~/.config/my_config/shrc.sh 
[ -f ~/.cargo/env ] && . "$HOME/.cargo/env"
alias sshx='ssh -o "ServerAliveInterval 60"  -o "ServerAliveCountMax 120" '
alias grepx='rg'
alias findx='fd'
force_color_prompt=yes

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/tripathyas/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
