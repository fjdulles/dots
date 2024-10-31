#!/bin/bash
#


#
# SSH stuff
#


#SSH_ENV="$HOME/.ssh/environment"

#function start_agent {
    #echo "Initialising new SSH agent..."
    #/usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    #echo succeeded
    #chmod 600 "${SSH_ENV}"
    #. "${SSH_ENV}" > /dev/null
    #/usr/bin/ssh-add;
#}

# Source SSH settings, if applicable

#if [ -f "${SSH_ENV}" ]; then
    #. "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    #ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        #start_agent;
    #}
#else
    #start_agent;
#fi

function doc
{
  pushd "/usr/share/doc/$1" && ls
}
export -f doc

function mk() {
  mkdir -p "$@" && cd "$@"
}

# Open man page as PDF mac specific
function manpdf() {
 man -t "${1}" | open -f -a /System/Applications/Preview.app/
}

cd ()
{
  case $# in
    0) builtin cd "$HOME" ;;
    1) builtin cd "$@" ;;
    2) old="$1"
       new="$2"
       dir=$(echo "$PWD" | sed "s:$old:$new:g")

       case "$dir" in
         "$PWD") echo "bash: cd: bad substitution" >&2 ; return 1 ;;
         *)      echo "$dir"
                 builtin cd "$dir"
           ;;
       esac
      ;;
    *) echo "cd: wrong arg count" >&2 ; return 1 ;;
  esac
}

function lk {
  cd "$(walk "$@")"
}

mkcd ()
{
  mkdir -p -- "$1" && cd -P -- "$1"
}

mdc ()
{
  mkdir -- "$1" && cd -P -- "$1"
}
# "repeat" command.  Like:
#
#	repeat 10 echo foo
repeat ()
{
    local count="$1" i;
    shift;
    for i in $(seq 1 "$count");
    do
        eval "$@";
    done
}

# Subfunction needed by `repeat'.
seq ()
{
    local lower upper output;
    lower=$1 upper=$2;
    while [ $lower -le $upper ];
    do
        output="$output $lower";
        lower=$[ $lower + 1 ];
    done;
    echo $output
}
