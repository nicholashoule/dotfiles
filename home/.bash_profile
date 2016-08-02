#--------------------------------------------
# .bash_profile
# INVOCATION
# A login shell is one whose first character of argument zero is a -, or  one  started
# with the --login option.
#
# An  interactive shell is one started without non-option arguments and without the -c
# option whose standard input and error are both connected to terminals (as determined
# by  isatty(3)),  or one started with the -i option.  PS1 is set and $- includes i if
# bash is interactive, allowing a shell script or a startup file to test this state.
#
# The following paragraphs describe how bash executes its startup files.   If  any  of
# the  files  exist but cannot be read, bash reports an error.  Tildes are expanded in
# filenames as described below under Tilde Expansion in the EXPANSION section.
#
# When bash is invoked as an interactive login shell, or as  a  non-interactive  shell
# with  the  --login  option,  it  first  reads  and  executes  commands from the file
# /etc/profile,  if  that  file  exists.   After  reading  that  file,  it  looks  for
# ~/.bash_profile,  ~/.bash_login,  and  ~/.profile, in that order, and reads and exe‐
# cutes commands from the first one that exists  and  is  readable.   The  --noprofile
# option may be used when the shell is started to inhibit this behavior.
#
# When an interactive shell that is not a login shell is started, bash reads and  exe‐
# cutes  commands from ~/.bashrc, if that file exists.  This may be inhibited by using
# the --norc option.  The --rcfile file option will force bash  to  read  and  execute
# commands from file instead of ~/.bashrc.
#--------------------------------------------
# Source the .profile and .bashrc file
# Load .bash_login, .profile and .bashrc (in that order)
#--------------------------------------------
[[ -e "$HOME/.bash_login" ]] && source "$HOME/.bash_login" # Load the default .bash_login
[[ -e "$HOME/.profile" ]] && source "$HOME/.profile"       # Load the default .profile
[[ -e "$HOME/.bashrc" ]] && source "$HOME/.bashrc"         # Load the default .bashrc
