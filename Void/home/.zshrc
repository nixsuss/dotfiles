# History Settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt appendhistory         # Append to history file instead of overwriting
setopt inc_append_history    # Write to history immediately
setopt share_history         # Share history between terminals

# Directory Behavior
setopt auto_pushd
setopt pushdignoredups
setopt autocd

# Completion Settings
autoload -U compinit
compinit

zmodload zsh/complist
_comp_options+=(globdots)

zstyle ':completion:*' menu select
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Editor
export EDITOR="vim"
export VISUAL="vim"

# Theme and Appearance
#[[ -f ~/.cache/wal/sequences ]] && cat ~/.cache/wal/sequences

# Plugins
source ~/.myzshthemes/duellj.zsh-theme
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Keybindings
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

# Aliases for XBPS
alias xu="sudo xbps-install -Su"
alias xin="sudo xbps-install -S"
alias xrm="sudo xbps-remove -R"
alias xrmf="sudo xbps-remove -RF"
alias xrmo="sudo xbps-remove -Ro"
alias xrmof="sudo xbps-remove -RFo"
alias xrmoc="sudo xbps-remove -ROo"
alias xrmocf="sudo xbps-remove -RFOo"
alias xrmc="sudo xbps-remove -O"
alias xs="xbps-query -Rs"
alias xS="xbps-query -RS"
alias xrmac="sudo rm -rf /var/cache/xbps/*"

# General Aliases
alias v="vim"
alias ls="lsd"
alias du="dust"
alias ahmed="fastfetch"
alias wttr="curl 'https://wttr.in/Port_Said?0' --silent --max-time 3"

# System Info on Startup
# fastfetch -l small
# curl 'https://wttr.in/Port_Said?0' --silent --max-time 3

