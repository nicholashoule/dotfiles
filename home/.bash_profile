# .bash_profile
#--------------------------------------------
# Source the .bashrc file
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

#--------------------------------------------
# OTHER 
#--------------------------------------------
if [[ -e "$HOME/.rvm/scripts/rvm" ]]; then
  source "$HOME/.rvm/scripts/rvm"    # Load RVM into a shell session *as a function*
  export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
fi

# JAVA information
#export JAVA_HOME="[PATH]"           # export JAVA_HOME

# aws client authentication information
# - This should go in a separate file
#export AWS_ACCESS_KEY=[key]         # export AWS_ACCESS_KEY
#export AWS_SECRET_KEY=[key]         # export AWS_SECRET_KEY
#export EC2_HOME="[path]"            # export EC2_HOME

# Nova client authentication information
# - This should go in a separate file
#export OS_USERNAME='[name]'
#export OS_PASSWORD='[password]'
#export OS_TENANT_NAME='[name]'
#export OS_AUTH_URL='https://localhost:5000/v2.0'
#export OS_AUTH_STRATEGY='[strategy]'
# The following lines can be omitted
#export OS_TENANT_ID='[id]'
#export NOVACLIENT_INSECURE=1
#export OS_NO_CACHE=1
