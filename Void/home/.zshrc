#History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt auto_pushd

#AutoCompletion
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _extensions _complete _approximate
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# Colorize completions using default `ls` colors. 
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.


export EDITOR="vim"
source ~/.myzshthemes/duellj.zsh-theme
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
cat ~/.cache/wal/sequences

#Keybinds
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

alias xu="sudo xbps-install -Su"
alias xin="sudo xbps-install -S"
alias xrm="sudo xbps-remove -R"
alias xrmf="sudo xbps-remove -RF"
alias xrmo="sudo xbps-remove -Ro"
alias xrmoc="sudo xbps-remove -ROo"
alias xrmof="sudo xbps-remove -RFo"
alias xrmocf="sudo xbps-remove -RFOo"
alias xrmc="sudo xbps-remove -O"
alias xs="xbps-query -Rs"
alias xS="xbps-query -RS"
alias v="vim"
alias ahmed="neofetch"
alias xrmac="sudo rm -rf /var/cache/xbps/*"
alias ls="lsd"
alias du="dust"
alias wttr="curl 'https://wttr.in/Port_Said?0' --silent --max-time 3"
pfetch
#neofetch --ascii_distro void_small
#curl 'https://wttr.in/Port_Said?0' --silent --max-time 3
