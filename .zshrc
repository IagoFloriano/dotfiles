# autosuggest from https://github.com/zsh-users/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#44475a,underline"
bindkey '^\' autosuggest-accept   # CTRL-\ to accept
bindkey '^]' autosuggest-execute  # CTRL-RETURN to execute
bindkey '^@' forward-word         # CTRL-SPACE to accept word
bindkey '^H' autosuggest-toggle   # CTRL-H to toggle sugestion

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=5000
setopt autocd extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/yv/.zshrc'
# End of lines added by compinstall
autoload -U colors && colors

# setting prompt
#
# github link to plugin https://github.com/zsh-git-prompt/zsh-git-prompt
source ~/.zsh/zsh-git-prompt/zshrc.sh
# variables for git prompt
ZSH_GIT_PROMPT_SHOW_UPSTREAM=1
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}%{● %G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✖ %G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{✚ %G%}"
ZSH_THEME_GIT_PROMPT_STASHED="%{$fg_bold[blue]%}%{⚑ %G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}%{… %G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔ %G%}"
#    bold   green user@hostname  white   :  magenta   directory
PROMPT='%B%{$fg[green]%}%n@%M%{$reset_color%}:%{$fg[magenta]%}%~ $(git_super_status)
%{$fg[green]%}->%{$reset_color%}%b '
#     green   ->  reset color

# setopt PROMPT_SUBST
# PROMPT='%B%{$fg[green]%}%n@%M%{$reset_color%}:%{$fg[magenta]%}%~
# %{$fg[green]%}->%{$reset_color%}%b '

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
autoload -U compinit && compinit -u
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

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
alias l='ls --color=auto -lh --group-directories-first'
alias ll='ls --color=auto -lh --group-directories-first'
alias la='ls --color=auto -A --group-directories-first'
alias lla='ls --color=auto -lhA --group-directories-first'

# other aliases
# alias bright="xrandr --output LVDS1 --brightness"
alias sxiv="devour nsxiv -rabf"
alias zathura="devour zathura"
alias vim="nvim"
alias svim="sudo -e"

alias mousescroll="xinput --set-prop 13 'libinput Scroll Method Enabled' 0, 0, "

alias dots='git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias gadd='git add'
alias gommit='git commit -m'
alias gpush='git push'
alias gpull='git pull'

alias rm='rm -I'
alias pipupdate="pip freeze --user | cut -d'=' -f1 | xargs -n1 pip install -U"

alias songs='yt-dlp --embed-thumbnail -x --audio-format mp3 --add-metadata "https://youtube.com/playlist?list=PLHZ3zKlk2w0uSiyEn11g1oVsPsXqvB9l6"'

# non global variables
EDITOR="/usr/bin/nvim"

# run on startup
$HOME/bin/ufetch
# colorscript exec arch

# zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
