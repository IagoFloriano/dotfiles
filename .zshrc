# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=5000
setopt autocd extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/iago/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
autoload -U colors && colors

# setting prompt
source ~/.zsh/zsh-git-prompt/zshrc.sh
#    bold   green user@hostname  white   :  magenta   directory
PROMPT="%B%{$fg[green]%}%n@%M%{$reset_color%}:%{$fg[magenta]%}%~ $(git_super_status)
%{$fg[green]%}->%{$reset_color%}%b "
#     green   ->  reset color

# vi mode
bindkey -v
export KEYTIMEOUT=1

#chande cursor shape on different vi modes
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
     echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'line' ]]; then
       echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
  zle -K viins
  echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[1 q' # default block cursor
preexec() { echo -ne '\e[1 q' ;} # use block cursor on each new prompt

# auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # include hidden files

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -v '^?' backward-delete-char

# ls aliases
alias ls='ls --color=auto --group-directories-first'
alias l='ls --color=auto -l --group-directories-first'
alias ll='ls --color=auto -l --group-directories-first'
alias la='ls --color=auto -A --group-directories-first'
alias lla='ls --color=auto -lA --group-directories-first'

# other aliases
# alias bright="xrandr --output LVDS1 --brightness"
alias sxiv="devour sxiv"
alias zathura="devour zathura"
alias vim="nvim"
alias svim="sudo -e"

alias mousescroll="xinput --set-prop 13 'libinput Scroll Method Enabled' 0, 0, "

alias connectcel="adb connect 192.168.15.13:5555"

alias dots='git --git-dir=$HOME/dotfiles --work-tree=$HOME'

# non global variables
EDITOR="/usr/bin/nvim"

# run on startup
$HOME/bin/ufetch
