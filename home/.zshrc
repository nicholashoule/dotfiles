# Set my default user so that the ZSH theme doesn't show the hostname.
DEFAULT_USER='$(whoami)'

export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="agnoster"
# custome options

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git osx ruby rbenv brew gem ssh-agent tmux)

# Load SSH identities
zstyle :omz:plugins:ssh-agent identities id_rsa gitlab_personal gitlab_work github_personal github_work

# Start oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Source my external alias config
source $HOME/.aliases

# PATH modifications. Don't modify if we're in TMUX because path_helper does it for us.
# I also modifed /etc/zprofile as shown here https://pgib.me/blog/2013/10/11/macosx-tmux-zsh-rbenv/
if [[ -z $TMUX ]]; then
  # Add homebrew's sbin dir to PATH
  export PATH="/usr/local/sbin:$PATH"

  # Initialize rbenv
  if which rbenv >/dev/null ; then
    [[ $PATH =~ 'rbenv/shims' ]] || eval "$(rbenv init -)"
  fi
fi

## Setup envpuppet
## Disabled because I want the native package on my mac to automate my mac.
## This should only be used for testing in vm's and such.
#export ENVPUPPET_BASEDIR="${HOME}/src/puppetlabs"
#eval $($ENVPUPPET_BASEDIR/puppet/ext/envpuppet)

