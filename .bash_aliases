#! /bin/bash
#
# .bash_aliases
#  echo "This is .bash_aliases"
#

# apt commands only useful on debian related linux
#
if [ $UID -ne 0 ]; then
    alias reboot='sudo reboot'
    alias shutdown='sudo /sbin/shutdown '
    alias upgrade='sudo /usr/bin/apt-get upgrade'
    alias update='sudo /usr/bin/apt-get update'
fi

# Enable aliases to be sudo’ed
alias sudo='sudo '
alias _="sudo"

#alias less="/usr/bin/less "
alias ,='cd ~-'
alias .4='cd ../../../../'
alias .3='cd ../../../'
alias ...='cd ../../'
alias ..='cd ../'

alias aptinstall='sudo apt-get install '
alias autoload='typeset -fu'

alias cdb='cd ~/bin'
alias cdp='cd ~-'
alias cdub='cd /usr/local/bin'

alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

alias cl=clear
#alias ct='/bin/rm *.aux *.dvi *.log'

#the following is better as a script that takes a size parameter.
#alias cull='lt| wc; find . -size -1k -name \*.jpg -type f | parallel -n 6 rm {} ; lt | tail -10 ; lt | wc'

alias cx='chmod 744'
#alias date=/bin/date
#alias dir='/bin/ls -Fla --color'
alias dir='/bin/ls -Fla '
alias fdf='/bin/df -PH '
alias dku='diskutil '
alias dl='/bin/ls -alF | less '
# replaced ds alias with a script in ~/bin
#alias ds='/usr/bin/du -sk * | sort -n; /usr/bin/du -skh'
alias egrep='egrep --color=auto '
alias eg=egrep

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum

alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

#alias etx='export TERM=xterm'
alias false="let 0"
alias flushdns="dscacheutil -flushcache"
alias functions='typeset -f'
alias g="git"
alias gs="git status "
alias grc="egrep '^#' "
alias grep='grep --color=auto '
alias gz=gzip
alias gzd='gzip -d'
alias hc='for i in $(/usr/bin/seq -w 0 40); do echo $i ; find . -name \*-\*-${i}.jpg | wc; done'

# get web server headers #
alias header='curl -I'

# Request using GET, POST, etc. method


for METHOD in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$METHOD"="lwp-request -m '$METHOD'"
done
unset METHOD

alias hosts="sudo $EDITOR /etc/hosts"
#alias his="historie"
alias quit="exit"
alias week="date +%V"
alias speedtest="wget -O /dev/null http://speed.transip.nl/100mb.bin"

alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume output volume 100'"

alias reload="exec ${SHELL} -l"
alias rel='reload'
alias rel="exec ${SHELL} -l"

 
# find out if remote server supports gzip / mod_deflate or not #
alias headerc='curl -I --compress'

## shortcut  for iptables and pass it via sudo#
#
# Not much use on a Mac
#
alias ipt='sudo /sbin/iptables'
 
# display all rules #
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ipl="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias firewall=iptlist
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Clean up LaunchServices to remove duplicates in the “Open With” menu
#alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

 

alias integer='typeset -i'
alias j="jobs -l"

if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
	export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
	colorflag="-G"
	export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

alias c="/bin/cat "
alias l.="/bin/ls -ald .[0-9A-z]* "
alias l="/bin/ls -CF --color"
alias lc="/bin/ls -CF --color"
alias la='/bin/ls -aF'
alias les='less '
alias ll='/bin/ls'
alias lswc='/bin/ls | /usr/bin/wc'
alias lt='/bin/ls -alrt'
alias ltt='ls -latr | tail -10'
#alias ltx='latex '
alias macsleep='osascript -e '\''tell application "Finder" to sleep'\'''
alias matrix='LC_ALL=C tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock | GREP_COLOR="1;32" grep --color "[^ ]"'
alias mkdir="mkdir -pv "
alias md=mkdir
#alias mailchk='ls -l /var/spool/mail/{dulles,fjd}'
alias motd='cat ~/motd'
alias more=i"/binless "
alias mount='mount | column -t '
#
alias pman="/usr/bin/groff -man -Tascii "
#alias psh="powershell "
alias pu="pushd"
alias r="fc -e -"
alias reload="source ~/.bash_profile"
alias run='ps | fgrep R'
alias sp='feh -rz. '
alias stop='kill -STOP'
alias suspend='kill -STOP '
alias t20='tail -20'
alias t25='tail -25'
alias t30='tail -30'
alias ta='type -a'
alias term='set noglob; eval `tset -Q -s `'
#alias tn=telnet
#Helps if the tree command is installed
alias tree="tree -A"
alias treed="tree -d"
alias tree1="tree -d -L 1"
alias tree2="tree -d -L 2"

alias mtop='/usr/bin/top -u -s 10'
alias true=":"
alias up='cd ..'
alias valias="vi $HOME/.bash_aliases"
alias vi="vim"
alias vprof="vi $HOME/.bash_profile"
alias vrc="vi $HOME/.bashrc"
alias xee="open -a /Applications/Xee³.app  ."
#alias vt100='export TERM=vt100'
#alias work='stty rows 60 columns 102'

alias aliases="alias | sed 's/=.*//'"
alias functions="declare -f | grep '^[a-z].* ()' | sed 's/{$//'"
alias paths='echo -e ${PATH//:/\\n}'

