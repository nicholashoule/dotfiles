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

# ALIAS DEFINITIONS
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

#--------------------------------------------
# OTHER SETTINGS
#--------------------------------------------
ulimit -S -c 0        # Don't want coredumps.
set -o notify
set -o noclobber
set -o ignoreeof
unset MAILCHECK

# SHOPT BUILTIN
# Values of variables controlling optional shell behavior
# Enabled options:
shopt -s checkhash
shopt -s checkwinsize
shopt -s sourcepath
shopt -s checkjobs
shopt -s cmdhist
shopt -s histappend histreedit histverify
shopt -s globstar
shopt -s dotglob
shopt -s extglob      # Necessary for programmable completion.
# Disabled options:
shopt -u mailwarn     # Don't want shell to warn me of incoming mail.

#--------------------------------------------
# HISTORY SETTINGS
#--------------------------------------------
# history length see HISTSIZE and HISTFILESIZE in bash(1)
# Add time and date to your bash history
# leave some commands out of history log
HISTFILESIZE=20000
HISTSIZE=10000
export HISTTIMEFORMAT="[%h %d %H:%M:%S] :"
export HISTCONTROL=ignoreboth
export HISTIGNORE="&:??:[ ]*:clear:exit:logout:history"

#--------------------------------------------
# PROMPT COLORS DEFINITIONS
#--------------------------------------------
# You may want to put all your additions into a separate file like
# ~/.bash_promt_colors , instead of adding them here directly.
if [ -f ~/.bash_promt ]; then
    . ~/.bash_promt
fi
