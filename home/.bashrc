# System .bashrc 
#--------------------------------------------
# CHECK PS1: not running interactively
#--------------------------------------------
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#--------------------------------------------
# SOURCE: global definitions
#--------------------------------------------
# GLOBAL DEFINITIONS
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

#--------------------------------------------
# SOURCE: functions
#--------------------------------------------
# LINUX FUNCTION DEFINITIONS
# You may want to put all your additions into a separate file like
# ~/.bash_functions, instead of adding them here directly.
if [ -f ~/.bash_functions ]; then
  . ~/.bash_functions
fi
  
# Export functions to other bash sub-shells
typeset -fx find_os_family

#--------------------------------------------
# SOURCE: aliases
#--------------------------------------------
if [ "${v_family}" == 'Linux' ] && [ -n "${v_family}" ]; then
  # LINUX ALIAS DEFINITIONS
  # You may want to put all your additions into a separate file like
  # ~/.bash_aliases, instead of adding them here directly.
  if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
  fi
fi

if [ "${v_family}" == 'Darwin' ] && [ -n "${v_family}" ]; then
  # DARWIN (OSX) ALIAS DEFINITIONS
  # You may want to put all your additions into a separate file like
  # ~/.aliases, instead of adding them here directly.
  if [ -f ~/.aliases ]; then
    . ~/.aliases
  fi
fi

#--------------------------------------------
# SOURCE: Other definitions
#--------------------------------------------
# PROMPT COLORS DEFINITIONS
# You may want to put all your additions into a separate file like
# ~/.bash_promt_colors , instead of adding them here directly.
if [ -f ~/.bash_promt_colors ]; then
    . ~/.bash_promt_colors
fi

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

if [ "${v_family}" == 'Linux' ] && [ -n "${v_family}" ]; then
  # OTHER SETTING DEFINITIONS
  # You may want to put all your additions into a separate file like
  # ~/.bash_settings, instead of adding them here directly.
  if [ -f ~/.bash_settings ]; then
      . ~/.bash_settings
  fi
fi

#--------------------------------------------
# PROMPT COLORS DEFINITIONS
#--------------------------------------------
# You may want to put all your additions into a separate file like
# ~/.bash_promt, instead of adding them here directly.
if [ -f ~/.bash_promt ]; then
    . ~/.bash_promt
fi
