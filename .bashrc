#!/bin/bash
# .bashrc
# Executed for all shell instances, interactive or otherwise
#

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
# echo "This is .bashrc"
# chet@ins.CWRU.Edu
#
#
# These are definitions for the ksh compiled-in `exported aliases'.  There
# are others, but we already have substitutes for them: "history", "type",
# and "hash".
#
# Some useful aliases.
#
source ~/.bash_path
source ~/.bash_aliases
source ~/.bash_functions

source ~/.bash_prompt
source ~/.bash_env
source ~/.bash_hh



export FCEDIT=vi
export HISTCONTROL=ignoreboth:erasedups
#export HISTFILESIZE=10000
#export HISTSIZE=15000
#export MAILCHECK=60
#export MAILPATH=/var/spool/mail/dulles

export LESS=Ncez-2y20
export TMOUT=0

export command_oriented_history=1
export auto_resume=substring
export cdable_vars=1

export VISUAL=vi
export EDITOR=vi
export PAGER=less
#export PROMPT_COMMAND="history -a"
#export TMPDIR=/tmp
CDPATH=".:..:../..:$HOME"

#
#shopt -s globstar
# Append to the Bash history file, rather than overwriting it
shopt -s histappend
# Autocorrect typos in path names when using `cd`
shopt -s cdspell
# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

#
# Commands for hh (from hh --show-configuration)
#
export HH_CONFIG=hicolor         # get more colors
#shopt -s histappend              # append new history items to .bash_history
#export HISTCONTROL=ignorespace   # leading space hides commands from history
#export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync
# if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh -- \C-j"'; fi

#bind -m vi

# SSH stuff
#
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}


if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi



#PROMPT_COMMAND='echo -en "\033]0; $(/usr/bin/basename $("pwd"))\a"'

#
# An almost-ksh compatible `whence' command.  This is as hairy as it is 
# because of the desire to exactly mimic ksh (whose behavior was determined
# empirically).
# 
# This depends somewhat on knowing the format of the output of the bash
# `builtin type' command.
#
# 
# whence ()
# {
#   local vflag
#   local path
# 
#   vflag=
#   path=
# 
#   if [ "$#" = "0" ]; then
#     echo "whence: argument expected"
#     return 1
#   fi
# 
#   case "$1" in
#     -v) vflag=1
#       shift 1
#       ;;
#     -*) echo "whence: bad option: $1"
#       return 1
#       ;;
#     *) ;;
#   esac
# 
#   if [ "$#" = "0" ]; then
#     echo "whence: bad argument count"
#     return 1
#   fi
# 
#   for cmd; do
#     if [ "$vflag" ]; then
#       echo $(builtin type $cmd | sed 1q)
#     else
#       path=$(builtin type -path $cmd)
# 
#       if [ "$path" ]; then
#         echo $path
#       else
#         case "$cmd" in
#           /*) echo ""
#             ;;
#           *)
#             case "$(builtin type -type $cmd)" in
#               "") echo ""
#                 ;;
#               *) echo "$cmd"
#                 ;;
#             esac
#           ;;
#         esac
#       fi
#     fi
#   done
#   return 0
# }

#

# cd ()
# {
#   case $# in
#     0) builtin cd "$HOME" ;;
#     1) builtin cd "$@" ;;
#     2) old="$1"
#        new="$2"
#        dir=$(echo "$PWD" | sed "s:$old:$new:g")
# 
#        case "$dir" in
#          "$PWD") echo "bash: cd: bad substitution" >&2 ; return 1 ;;
#          *)      echo "$dir"
#                  builtin cd "$dir"
#            ;;
#        esac
#       ;;
#     *) echo "cd: wrong arg count" >&2 ; return 1 ;;
#   esac
# }
# 
# cd

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


#
# ksh print emulation
#
#	print [-Rnprsu[n]] [arg ...]
#
#	-	end of options
#	-R	BSD-style -- only accept -n, no escapes
#	-n	do not add trailing newline
#	-p	no-op (no coprocesses)
#	-r	no escapes
#	-s	no-op (print to the history file)
#	-u n	redirect output to fd n
#
# 
# print()
# {
#   local eflag=-e
#   local nflag=
#   local fd=1
# 
#   OPTIND=1
# 
#   while getopts "Rnprsu:" c; do
#     case $c in
#       R|r) eflag= ;;
#       n)   nflag=-n ;;
#       u)   redir=">&$OPTARG"
#            fd=$OPTARG
#         ;;
#       p|s) ;;
#     esac
#   done
# 
#   shift $[ $OPTIND - 1 ]
#   echo $eflag $nflag "$@" >&$fd
# }
# 
# # "repeat" command.  Like:
# #
# #	repeat 10 echo foo
# repeat ()
# { 
#     local count="$1" i;
#     shift;
#     for i in $(seq 1 "$count");
#     do
#         eval "$@";
#     done
# }
# 
# # Subfunction needed by `repeat'.
# seq ()
# { 
#     local lower upper output;
#     lower=$1 upper=$2;
#     while [ $lower -le $upper ];
#     do
#         output="$output $lower";
#         lower=$[ $lower + 1 ];
#     done;
#     echo $output
# }
#cd
