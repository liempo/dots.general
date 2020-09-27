# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Update wal colors (must be initialized in .fehbg)
cat ~/.cache/wal/sequences

# oh-my-zsh themes
ZSH_THEME="agnoster"

# oh-my-zsh plugins
plugins=(git)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Rebind ctrl hjkl
bindkey '^J' down-line-or-history
bindkey '^K' up-line-or-history
bindkey '^L' forward-char
bindkey '^H' backward-char

# Aliases
alias bt="bluetoothctl"
alias ls="ls -l --block-size=M"
alias dots='git --git-dir=$HOME/.dots/ --work-tree=$HOME'

# Hide username and host
prompt_context() {}

# Run 'ls' every 'cd'
function chpwd() {
    emulate -L zsh
    ls -a
}
