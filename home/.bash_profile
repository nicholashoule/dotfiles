#--------------------------------------------
# .bash_profile
# Load .profile and .bashrc (in that order)
#--------------------------------------------
# Source the .profile and .bashrc file
#--------------------------------------------
[[ -e "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
[[ -e "$HOME/.bashrc" ]] && source "$HOME/.bashrc"   # Load the default .bashrc

#--------------------------------------------
# Default User specific env path
#--------------------------------------------
PATH="$PATH"
export PATH

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
