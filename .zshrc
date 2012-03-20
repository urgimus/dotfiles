# ---------------------------------------------------------------------------- #
#
# ~/.zshrc
# Last updated: 04.10.2011
#
# ---------------------------------------------------------------------------- #
##### Options 
#
# . ~/.bin/infinality-settings.sh
#
HISTFILE="$HOME/.zsh_history_`hostname`"
HISTSIZE=50000
SAVEHIST=50000

export LANG="ru_RU.UTF-8"
export LC_ALL="ru_RU.UTF-8"
# export TERM=xterm-256color
# export TERM=screen-256color
# export TERM=rxvt-unicode-256color
export EDITOR="vim"
export PAGER="vim -R"
export MANPAGER="most"
export BROWSER="firefox"
# export PATH="${PATH}:${HOME}/.bin"
# export PATH="/usr/local/lib/cw:$PATH" # need to install cw (http://cwrapper.sourceforge.net/)
# export PATH="$PATH:/sbin:/usr/sbin:/usr/local/sbin" # Slackware

export PATH="${PATH}:${HOME}/.bin:/sbin:/usr/sbin:/usr/local/sbin:/usr/local/lib/cw"
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'
export DISPLAY=:0.0
# export LS_COLORS=`dircolors -b "$HOME/.dircolors"`

# Window title
case $TERM in
    *xterm*|rxvt|rxvt-unicode|rxvt-256color|(dt|k|E)term)
        precmd () { print -Pn "\e]0;$TERM - (%L) [%n@%M]%# [%~]\a" }
        preexec () { print -Pn "\e]0;$TERM - (%L) [%n@%M]%# [%~] ($1)\a" }
    ;;
    screen)
        precmd () {
            print -Pn "\e]83;title \"$1\"\a"
            print -Pn "\e]0;$TERM - (%L) [%n@%M]%# [%~]\a"
        }
        preexec () {
            print -Pn "\e]83;title \"$1\"\a"
            print -Pn "\e]0;$TERM - (%L) [%n@%M]%# [%~] ($1)\a"
        }
    ;;
esac

##### Keybindings

bindkey -v
typeset -g -A key
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line
bindkey '^?' backward-delete-char
bindkey '^[[1~' beginning-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[3~' delete-char
bindkey '^[[4~' end-of-line
bindkey '^[[6~' down-line-or-history
bindkey '^[[A' up-line-or-search
bindkey '^[[D' backward-char
bindkey '^[[B' down-line-or-search
bindkey '^[[C' forward-char
# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
# for gnome-terminal
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line

##### Aliases

alias ls='ls -C --color=always --classify --size -k --human-readable' 
alias ll='ls -alkF'
alias la='ls -A'
alias lls="ls -l | sed -e 's/--x/1/g' -e 's/-w-/2/g' -e 's/-wx/3/g' -e 's/r--/4/g'  -e 's/r-x/5/g' -e 's/rw-/6/g' -e 's/rwx/7/g' -e 's/---/0/g'"
alias reciso="growisofs -dvd-compat -Z /dev/dvd=" # запись образа
alias catiso="cat /dev/cdrom > image.iso"         # снять образ диска
alias blankcd="growisofs -Z /dev/cdrom=/dev/zero" # или dvd+rw-format -f /dev/dvd # очистить dvd
alias rec="growisofs -Z /dev/dvd -R -J"           # запись каталога на диск
alias eject='sudo eject /dev/sr0'
alias mountiso='sudo mount -o loop -t iso9660'    # монтирование iso. mountiso [что] [куда]
alias mountnrg='mount -t udf,iso9660 -o loop,ro,offset=307200' # монтирование nrg. mountnrg [что] [куда]
alias wget='wget -c --passive-ftp --no-check-certificate'
alias ka='killall'
alias ip='wget http://checkip.dyndns.org/ -O - -o /dev/null | cut -d: -f 2 | cut -d\< -f 1'
alias upfonts='sudo fc-cache -vf'
alias capture='ffmpeg -f x11grab -s wxga -r 25 -i :0.0 -sameq ~/capture.mpg'
alias xe='cat /var/log/Xorg.0.log |grep EE'
alias xw='cat /var/log/Xorg.0.log |grep WW'
alias gettime='sudo /usr/sbin/ntpdate ru.pool.ntp.org'
alias nc='ncmpcpp'
alias setbright='sudo setpci -s 00:02.0 F4.B=99'
alias Xdefaults="xrdb -load ~/.Xdefaults"
alias sv='sudo vim'
alias vx='vim ~/.xmonad/xmonad.hs'
alias nano='nano -W -m'
alias R='exec zsh'
alias lp='ls /var/log/packages/ | grep '
alias mc="mc --colors base_color=lightgray,black:normal=lightgray,black:selected=black,cyan:marked=yellow,black:markselect=yellow,cyan:errors=white,red:menu=white,cyan:reverse=black,lightgray:dnormal=black,lightgray:dfocus=black,cyan:dhotnormal=yellow,lightgray:dhotfocus=yellow,cyan:viewunderline=brightred,blue:menuhot=yellow,cyan:menusel=lightgrey,black:menuhotsel=yellow,black:helpnormal=black,lightgray:helpitalic=red,lightgray:helpbold=yellow,lightgray:helplink=black,cyan:helpslink=yellow,black:gauge=white,black:input=black,cyan:directory=white,black:executable=brightgreen,black:link=lightgray,black:stalelink=brightred,black:device=brightmagenta,black:core=red,black:special=black,blue:editnormal=lightgray,black:editbold=yellow,black:editmarked=black,cyan:errdhotnormal=yellow,red:errdhotfocus=yellow,lightgray"



alias mkdir="mkdir -p -v"
alias df='df -h'
alias du='du -h -c'
alias cp="cp -ir"
alias mv="mv -i"
alias rm="rm -I -v"
alias h="history"

# Package manager
# aptitude:
alias ,="aptitude"
alias ,,="apt-get"
alias ,,,="dpkg"
alias ,l="dpkg -l"
alias ,ll="dpkg -L"
alias ,o="dpkg -S"
alias ,s="aptitude search"
alias show="aptitude show"
alias ,u="sudo aptitude update"
alias ,uu="sudo aptitude update && sudo aptitude safe-upgrade"
alias ,i="sudo aptitude install"
alias ,ii="sudo dpkg -i"
alias ,r="sudo aptitude remove"
alias ,p="sudo aptitude purge"
alias ,rl="dpkg -l | grep '^rc'"
alias ,rr="sudo dpkg -l | sudo awk '/^rc/{print $2}' | sudo xargs dpkg -P"
alias ,pl="sudo dpkg --get-selections >> ~/my_packages.txt"
# Wi-Fi
alias .wu="sudo /sbin/ifconfig wlan0 up ; sudo /etc/init.d/dhcpd start"
alias .wd="sudo /etc/init.d/dhcpd stop ; sudo /sbin/ifconfig wlan0 down"

##### Compilation Style

autoload -U compinit
compinit -C
autoload -U incremental-complete-word
zle -N incremental-complete-word
autoload -U insert-files
zle -N insert-files
autoload -U predict-on
zle -N predict-on

zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile
zmodload zsh/complist

zstyle ':completion:*' menu yes select
eval `dircolors`
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:processes' command 'ps -xuf'
zstyle ':completion:*:processes' sort false
zstyle ':completion:*:processes-names' command 'ps xho command'

zstyle ':completion:*:sudo:*' command-path $path /usr/bin /sbin /usr/sbin /usr/local/sbin

setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt AUTO_CD
setopt CORRECT_ALL
setopt histfindnodups
setopt menucomplete

setopt   notify globdots correct pushdtohome cdablevars autolist
setopt   correctall autocd recexact longlistjobs
setopt   autoresume histignoredups pushdsilent noclobber
setopt   autopushd pushdminus extendedglob rcquotes mailwarning
unsetopt bgnice autoparamslash

##### Prompt

autoload -U colors && colors
PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[green]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "
SPROMPT='zsh: Исправить '\''%R'\'' на '\''%r'\'' ? [Yes/No/Abort/Edit] '
# autoload -U promptinit; promptinit; prompt gentoo

##### Function

# x - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       rar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# roll - archive wrapper
# usage: roll <foo.tar.gz> ./foo ./bar
roll ()
{
  FILE=$1
  case $FILE in
    *.tar.bz2) shift && tar cjf $FILE $* ;;
    *.tar.gz) shift && tar czf $FILE $* ;;
    *.tgz) shift && tar czf $FILE $* ;;
    *.zip) shift && zip $FILE $* ;;
    *.rar) shift && rar $FILE $* ;;
  esac
}

# Creates an archive from given directory
mktar() { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }
mktgz() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }

#alias mktar="tar -cvf"
#alias mkbz2="tar -cvjf"
#alias mkgz="tar -cvzf"
#alias untar="tar -xvf"
#alias unbz2="tar -xvjf"
#alias ungz="tar -xvzf"

# генератор паролей
function mkpass() { cat /dev/urandom | tr -d -c 'a-zA-Z0-9' | fold -w 24 | head -1 }

# 20% превьюшка картинки
thumb() {
  for pic in "$@"; do
    case "$pic" in
      *.jpg) thumb="$(echo "$pic" | sed s/.jpg/-thumb.jpg/g)" ;;
      *.jpeg) thumb="$(echo "$pic" | sed s/.jpeg/-thumb.jpeg/g)" ;;
      *.png) thumb="$(echo "$pic" | sed s/.png/-thumb.png/g)" ;;
      *) echo "usage: thumbit [file{.jpg,.jpeg,.png}]" && return 1 ;;
    esac
    cp "$pic" "$thumb"
    mogrify -resize 20% "$thumb"
  done
}

# mp3 в utf (cd /music/dir && mp32utf)
mp32utf() { find -iname '*.mp3' -print0 | xargs -0 mid3iconv -eCP1251 --remove-v1 }

#
ompload() { curl -F file1=@"$1" http://omploader.org/upload|awk '/Info:|File:|Thumbnail:|BBCode:/{gsub(/<[^<]*?\/?>/,"");$1=$1;sub(/^/,"\033[0; 34m");sub(/:/,"\033[0m:");print}' }

#
grab() {
	sudo chown -R ${USER} ${1:-.}
}

# backup 
bu () { cp $1 ~/Backup/`basename $1`-`date +%Y-%m-%d-%H-%M`.backup ; }

precmd()
{
    if [[ ( ${-} == *i* ) && ( ${TERM} == screen* ) ]]
    then
        echo -n "\ek$(hostname -s)\e\\"
    fi
}

color-blocks () {   
    echo
    local width=$(( ($COLUMNS / 16) -1 ))
    local chars
    local pre=$(( ( $COLUMNS - ($width+1)*16)/2 ))
    for ((i=0; i<$width; i++)); chars+="░"
    for ((i=0; i<$pre; i++)); echo -n " " 
    for ((i=0; i<=7; i++)); echo -en "\e[3${i}m${chars} \e[1;3${i}m${chars}\e[m "; echo; echo
    unset i
}
