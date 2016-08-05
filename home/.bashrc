#--------------------------------------------
# .bashrc 
# Interactive command line
#--------------------------------------------
# CHECK PS1: not running interactively
#--------------------------------------------
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

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
# Source bash utils functions and call main()
#--------------------------------------------
if [ -d ~/.src/bash/utils/ ]; then
  for file in ~/.src/bash/utils/* ; do
    source "${file}"
    bash.utils.consoleLog 'Sourced bash utils functions'
  done
else
  printf "%s\n" "[WARNING]: Couldn't source 'src/bash/utils/functions'."
fi

#--------------------------------------------
# Variables
#--------------------------------------------
# Get/Set v_family variable
v_os_family=$(bash.utils.find_os_kernel)

#--------------------------------------------
# SOURCE: aliases
#--------------------------------------------
if [[ "${v_os_family}" == 'Linux' ]] && [[ -n "${v_os_family}" ]]; then
  # LINUX ALIAS DEFINITIONS
  # You may want to put all your additions into a separate file like
  # ~/.bash_aliases, instead of adding them here directly.
  [[ -e "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases" # Load the .bash_aliases
fi

if [[ "${v_os_family}" == 'Darwin' ]] && [[ -n "${v_os_family}" ]]; then
  # DARWIN (OSX) ALIAS DEFINITIONS
  # You may want to put all your additions into a separate file like
  # ~/.aliases, instead of adding them here directly.
  [[ -e "$HOME/.aliases" ]] && source "$HOME/.aliases" # Load the .aliases
fi

#--------------------------------------------
# SOURCE: Other definitions
#--------------------------------------------
# PROMPT COLORS DEFINITIONS
# You may want to put all your additions into a separate file like
# ~/.bash_prompt_colors , instead of adding them here directly.
[[ -e "$HOME/.bash_prompt_colors" ]] && source "$HOME/.bash_prompt_colors"

# PROGRAMMABLE COMPLETION DEFINITIONS
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion.d/ ]; then
    . /etc/bash_completion
    fi
fi

if [[ "${v_os_family}" == 'Linux' ]] && [[ -n "${v_os_family}" ]]; then
  # OTHER SETTING DEFINITIONS
  # You may want to put all your additions into a separate file like
  # ~/.bash_settings, instead of adding them here directly.
  [[ -e "$HOME/.bash_settings" ]] && source "$HOME/.bash_settings"
fi

#--------------------------------------------
# PROMPT DEFINITIONS
#--------------------------------------------
# You may want to put all your additions into a separate file like
# ~/.bash_prompt, instead of adding them here directly.
[[ -e "$HOME/.bash_prompt" ]] && source "$HOME/.bash_prompt"
