#--------------------------------------------
# .bash_profile
# When bash is invoked as an interactive login shell, or as a non-interactive 
# shell with the --login option, it first reads and executes commands from the 
# file /etc/profile, if that file exists. After reading that file, it looks for 
# ~/.bash_profile, ~/.bash_login, and ~/.profile, in that order, and reads and 
# executes commands from the first one that exists and is readable. The --noprofile 
# option may be used when the shell is started to inhibit this behavior.
# Load .bash_login, .profile and .bashrc (in that order)
#--------------------------------------------
# Source the .profile and .bashrc file
#--------------------------------------------
[[ -e "$HOME/.bash_login" ]] && source "$HOME/.bash_login" # Load the default .bash_login
[[ -e "$HOME/.profile" ]] && source "$HOME/.profile"       # Load the default .profile
[[ -e "$HOME/.bashrc" ]] && source "$HOME/.bashrc"         # Load the default .bashrc

#--------------------------------------------
# Linux - custom bash completion scripts
#--------------------------------------------
# See .bash_alias 'gitbash' to get github file
if [ -d ~/.bash_completion.d/ ]; then
  for file in ~/.bash_completion.d/* ; do
    source "${file}"
  done
fi

#--------------------------------------------
#OSX - Homebrew
#--------------------------------------------
# . $(brew --prefix)/etc/bash_completion
if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
fi

#--------------------------------------------
#OSX - MacPorts
#--------------------------------------------
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi
