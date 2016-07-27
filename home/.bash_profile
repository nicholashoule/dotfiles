# .bash_profile
#--------------------------------------------
# Source the .bashrc file
#--------------------------------------------
[[ -e ~/.bashrc ]] && . ~/.bashrc

#--------------------------------------------
# User specific environment
#--------------------------------------------
PATH="$PATH:"
export PATH

#--------------------------------------------
#OSX - Homebrew
#--------------------------------------------
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

#--------------------------------------------
#OSX - MacPorts
#--------------------------------------------
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

#--------------------------------------------
# OTHER 
#--------------------------------------------
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc" # Load the default .bashrc
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
