#!/bin/bash
#


#
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

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

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
 man -t "${1}" | open -f -a /Applications/Preview.app/
}