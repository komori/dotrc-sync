#{{{ Set up the prompt

autoload -Uz compinit promptinit
compinit
promptinit


#{{{ Options
#setopt AUTO_CD
setopt AUTO_PUSHD
#setopt PUSHD_SILENT
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_TO_HOME
setopt PUSHD_MINUS
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt NO_CASE_GLOB
setopt NO_CASE_MATCH
setopt EXTENDED_GLOB
setopt NO_CASE_GLOB
setopt NUMERIC_GLOB_SORT
setopt MULTIOS

# 10 second wait if you do something that will delete everything
setopt RM_STAR_WAIT

# use magic (this is default, but it can't hurt!)
setopt ZLE

export EDITOR="vim"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8


#Custom colors
fg_black=%{$'\e[0;30m'%}
fg_red=%{$'\e[0;31m'%}
fg_green=%{$'\e[0;32m'%}
fg_brown=%{$'\e[0;33m'%}
fg_blue=%{$'\e[0;34m'%}
fg_purple=%{$'\e[0;35m'%}
fg_cyan=%{$'\e[0;36m'%}
fg_lgray=%{$'\e[0;37m'%}
fg_dgray=%{$'\e[1;30m'%}
fg_lred=%{$'\e[1;31m'%}
fg_lgreen=%{$'\e[1;32m'%}
fg_yellow=%{$'\e[1;33m'%}
fg_lblue=%{$'\e[1;34m'%}
fg_pink=%{$'\e[1;35m'%}
fg_lcyan=%{$'\e[1;36m'%}
fg_white=%{$'\e[1;37m'%}
#Text Background Colors
bg_red=%{$'\e[0;41m'%}
bg_green=%{$'\e[0;42m'%}
bg_brown=%{$'\e[0;43m'%}
bg_blue=%{$'\e[0;44m'%}
bg_purple=%{$'\e[0;45m'%}
bg_cyan=%{$'\e[0;46m'%}
bg_gray=%{$'\e[0;47m'%}
#Attributes
at_normal=%{$'\e[0m'%}
at_bold=%{$'\e[1m'%}
at_italics=%{$'\e[3m'%}
at_underl=%{$'\e[4m'%}
at_blink=%{$'\e[5m'%}
at_outline=%{$'\e[6m'%}
at_reverse=%{$'\e[7m'%}
at_nondisp=%{$'\e[8m'%}
at_strike=%{$'\e[9m'%}
at_boldoff=%{$'\e[22m'%}
at_italicsoff=%{$'\e[23m'%}
at_underloff=%{$'\e[24m'%}
at_blinkoff=%{$'\e[25m'%}
at_reverseoff=%{$'\e[27m'%}
at_strikeoff=%{$'\e[29m'%}

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# keybindings for special keys
bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[4~" end-of-line # End

# Keep X lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zhistory

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

PROMPT="[${fg_dgray}%n${fg_lgray}@${fg_lblue}%m${fg_white}:${fg_cyan}%~${fg_white}] %# "
RPROMPT="[${fg_green}%* ${fg_green}%?${fg_white}]"

###
# Aliases
###

## System ##
alias sudo='sudo '
alias sd='sudo '
alias root=’sudo su -’
alias tmx='tmux att'
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'
alias lsuser='cat /etc/passwd | cut -d":" -f1'
alias lsgroup='cat /etc/group'

## List ##
alias l='ls --color=auto -Cf'
alias ls='ls --color=auto -CF'
alias sl='ls --color=auto -CF'
alias ll='ls --color=auto --sort=extension -lFh'
alias la='ls --sort=extension -lAh'
alias lard='ls --color -lAgRh'
#alias lsl='ls -lhFA | less'

## Security ##
alias passchk="sudo awk -F: '($2 == "") { print $1 }' /etc/shadow"

## Shell Misc ##
alias rldz='source ~/.zshrc'
alias edz='nano ~/.zshrc'
alias hh='history'
alias hhg='history | grep'
alias galias='alias | grep -i'
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'

## Navigation
alias pu='pushd'
alias po='popd'
alias x='exit'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias cd..='..'
alias cd...='...'
alias cd....='....'

## Search ##
alias fhere='find . -name'
alias find24='find . -mtime -1'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
#alias -g G='| grep -'
#alias -g L='| less'
alias updb='sudo updatedb'

## Files & Dirs ##
alias mkdir='mkdir -pv'
alias dfree='df -h'
alias dftotal='df -Tha --total'
alias duh='du -ach | sort -h'
alias syml='ln -s'

## Perms ##
#alias rm='rm -I --preserve-root'
# confirmation
alias mv='mv -i'
alias cp='cp -i'
#alias ln='ln -i'
# Parenting changing perms on / #
alias chown='chown --preserve-root -v'
alias chmod='chmod --preserve-root -v'
alias chgrp='chgrp --preserve-root -v'

## Editors
alias nn='nano'
alias snn='sudo nano'
alias vi='vim'
alias svi='sudo vim'
alias sim='sudo vim'
alias vis='vim "+set si"'
alias edit='vim'

## Network
alias ports='netstat -tulanp'
#alias ntop='sudo iftop -i venet0'
alias getmyip='getent hosts'
#alias getmyip6='(TBD)'
alias wget='wget -c'

## System Maintenance
alias apt='sudo aptitude'
alias aps='aptitude search'
alias apco='apt-cache showpkg'
alias apcs='apt-cache search'
alias apcp='apt-cache policy'
alias apcstat='apt-cache stats'
alias apcdep='apt-cache depends'
alias apcrdep='apt-cache rdepends'
alias update='sudo aptitude update'
alias install='sudo aptitude install'
alias upgrade='sudo aptitude safe-upgrade'
alias distup='sudo aptitude full-upgrade'
alias remove='sudo aptitude remove'
alias purge='sudo aptitude purge'
#alias backportchk="aptitude search '?narrow(?version(CURRENT),?origin(Debian Backports))' -F '%100p'"

## sshd / httpd / Webstack
alias rldssh='sudo service ssh reload'
alias restartssh='sudo service ssh restart'
alias rldngx='sudo service nginx reload'
alias ngntest='sudo /usr/local/nginx/sbin/nginx -t'
alias stopngx='sudo service nginx stop'
alias rldphp='sudo service php5-fpm reload'
alias startphp='sudo service php5-fpm start'
alias stopphp='sudo service php5-fpm stop'
#alias l2r='sudo /etc/init.d/lighttpd restart'

## Extra Programs
#alias top='htop'
alias diff='colordiff'
alias inxspec='inxi -v4 -c6'
#alias


# become root #
#alias root='sudo -i'
#alias su='sudo -i'
