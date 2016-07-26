#CHECK PS1: not running interactively
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# SOURCE: global definitions
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

# PROGRAMMABLE COMPLETION
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

# SOME SETTINGS
ulimit -S -c 0  # Don't want coredumps.
set -o notify
set -o noclobber
set -o ignoreeof
# SHOPT BUILTIN
# Toggle the values of variables controlling optional shell behavior
# Enable options:
shopt -s checkhash
shopt -s checkwinsize
shopt -s sourcepath
shopt -s checkjobs
shopt -s cmdhist
shopt -s histappend histreedit histverify
shopt -s globstar
shopt -s dotglob
shopt -s extglob # Necessary for programmable completion.
# Disable options:
# Don't want shell to warn me of incoming mail.
shopt -u mailwarn
unset MAILCHECK

# FORCE COLOR PROMPT
# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

# COLOR PROMPT CHECK
if [ -n "${force_color_prompt}" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

# HISTORY SETTINGS: bash history
# history length see HISTSIZE and HISTFILESIZE in bash(1)
# Add time and date to your bash history
# leave some commands out of history log
HISTFILESIZE=20000
HISTSIZE=10000
export HISTTIMEFORMAT="[%h %d %H:%M:%S] :"
export HISTCONTROL=ignoreboth
export HISTIGNORE="&:??:[ ]*:clear:exit:logout:history"

#--------------------------------------------
# COMMAND PROMPT: (PS1)
#--------------------------------------------
### Style: color_prompt style and customization goes here
if [ "${color_prompt}" = yes ]; then
echo -e "${v_banner_blue}\nWelcome: ${v_close}"
echo -e "${v_banner_blue}===============================================${v_close}"
echo -e "${v_banner_blue}DATE: ${v_close}${v_white}${v_date}${v_close}\n"
echo -e "${v_green} Where there is a shell, there is a way. #ROOT ${v_close}\n"
echo -e "${v_banner_blue}SYSTEM INFORMATION:${v_close}"
echo -e "${v_banner_blue}KERNEL: ${v_close}${v_white}${v_uname}${v_close}"
echo -e "${v_banner_blue}BASH: ${v_close}${v_white}${BASH_VERSION%.*} ${v_close}"
echo -e "${v_banner_blue}HOSTNAME: ${v_close}${v_white}${v_hostname}${v_close}\n"
echo -e "${v_banner_blue}INFO: ${v_close}${v_white}$(who)${v_close}\n"
echo -e "$(ip addr | grep --color=always 'inet ' 2>/dev/null)"
echo -e "${v_banner_blue}===============================================${v_close}"
# COMMAND PROMPT: PS1 Color version
PS1="\[${v_white}\][ \d \t ] \[${v_lightred}\]\u\[${v_white}\]@\[${v_white}\]\h:\n\
\[${v_lightcyan}\]\w\[${v_white}\] $ \[${v_close}\]"
else
# COMMAND PROMPT: PS1 Normal version
PS1="[ \d \t \u@\h:\w ]_$ "
fi

# unset variables
unset color_prompt force_color_prompt v_uname v_date v_hostname
