# .bash_profile
#--------------------------------------------
# Source the .bashrc file
#--------------------------------------------
[[ -e "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
[[ -e "$HOME/.bashrc" ]] && source "$HOME/.bashrc"   # Load the default .bashrc

#--------------------------------------------
# Default User specific env path
#--------------------------------------------
PATH="$PATH:"
export PATH

#--------------------------------------------
# Linux - custom bash completion scripts
#--------------------------------------------
if [ -d ~/.bash_completion.d/ ]; then
    . ~/.bash_completion.d/.git-completion.bash
fi

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
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
