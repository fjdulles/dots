#!/bin/bash
# .bash_profile
#
# Executed only by login shells under bash
# The first file (other than .profile) that bash loads

# If not running interactively, don't do anything

[ -z "$PS1" ] && return


#
# other basic stuff 
#
umask 066

source $HOME/.bashrc 
source $HOME/.bash_path
source $HOME/.bash_aliases
source $HOME/.bash_env
source $HOME/.bash_functions
source $HOME/.bash_hh
source $HOME/.bash_prompt
echo "Sourced .bash files"

[ -f "~/macosdefaults.sh" ] && source macosdefaults.sh  #Don't run if on Linux

source $HOME/.bash_prompt

#if which gdircolors &> /dev/null && eval $(gdircolors ~/.dircolors/dircolors.256dark) #broken

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/completions" ]; then
	source "$(brew --prefix)/share/bash-completion/completions";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Enable tab completion for `g` by marking it as an alias for `git`
#
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

#
# Set shell options
#
#shopt -s globstar
#
# Set up the prompt.
#
# source ~/.bash_prompt
# source $HOME/.bashrc
# 
# export RAN_BASH_PROFILE=yes
# if [ -f ~/.bashrc ]; then
# 	if [ !$RAN_BASH_RC ]; then
#   		source ~/.bashrc
# 	fi
# fi
#cd

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# #
# # Resolve DOTFILES_DIR (assuming ~/.dotfiles on distros without readlink and/or $BASH_SOURCE/$0)
# 
# READLINK=$(which greadlink || which readlink)
# CURRENT_SCRIPT=$BASH_SOURCE
# 
# if [[ -n $CURRENT_SCRIPT && -x "$READLINK" ]]; then
#   SCRIPT_PATH=$($READLINK -f "$CURRENT_SCRIPT")
#   DOTFILES_DIR=$(dirname "$(dirname "$SCRIPT_PATH")")
# elif [ -d "$HOME/.dotfiles" ]; then
#   DOTFILES_DIR="$HOME/.dotfiles"
# else
#   echo "Unable to find dotfiles, exiting."
#   return
# fi
# 
# # Make utilities available
# 
# PATH="$DOTFILES_DIR/bin:$PATH"
# 
# # Read cache
# 
# DOTFILES_CACHE="$DOTFILES_DIR/.cache.sh"
# [ -f "$DOTFILES_CACHE" ] && . "$DOTFILES_CACHE"
# 
# # Finally we can source the dotfiles (order matters)
# 
# for DOTFILE in "$DOTFILES_DIR"/system/.{function,function_*,path,env,alias,completion,grep,prompt,nvm,rvm,custom}; do
#   [ -f "$DOTFILE" ] && . "$DOTFILE"
# done
# 
# if is-macos; then
#   for DOTFILE in "$DOTFILES_DIR"/system/.{env,alias,function}.macos; do
#     [ -f "$DOTFILE" ] && . "$DOTFILE"
#   done
# fi
# 
# # Set LSCOLORS
# 
# eval "$(dircolors "$DOTFILES_DIR"/system/.dir_colors)"
# 
# # Hook for extra/custom stuff
# 
# DOTFILES_EXTRA_DIR="$HOME/.extra"
# 
# if [ -d "$DOTFILES_EXTRA_DIR" ]; then
#   for EXTRAFILE in "$DOTFILES_EXTRA_DIR"/runcom/*.sh; do
#     [ -f "$EXTRAFILE" ] && . "$EXTRAFILE"
#   done
# fi
# 
# # Clean up
# 
# unset READLINK CURRENT_SCRIPT SCRIPT_PATH DOTFILE EXTRAFILE
# 
# # Export
# 
# export DOTFILES_DIR DOTFILES_EXTRA_DIR
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/Users/fjd/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/Users/fjd/opt/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/Users/fjd/opt/anaconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/Users/fjd/opt/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<


source /Users/fjd/.config/broot/launcher/bash/br
#eval "$(/opt/homebrew/bin/brew shellenv)"
export MODULAR_HOME="/Users/fjd/.modular"
export PATH="/Users/fjd/.modular/pkg/packages.modular.com_max/bin:$PATH"
export MODULAR_HOME="/Users/fjd/.modular"
export PATH="/Users/fjd/.modular/pkg/packages.modular.com_max/bin:$PATH"
