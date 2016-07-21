# ALIAS COLOR SUPPORT
# color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

  # Some shortcuts for different directory listings
  alias ls='ls -hF --color=auto'					# classify files in colour
	alias dir='ls --color=auto --format=vertical'
	alias vdir='ls --color=auto --format=long'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'
  alias grep='grep --color=auto'					# show differences in colour
  alias fgrep='fgrep --color=auto'				# show differences in colour
  alias egrep='egrep --color=auto'				# show differences in colour
fi

### ADD alias here, or add to ~/.bash_aliases
## Interactive operation...
alias mount='mount | column -t'      # Make mount command output pretty and human readable
alias rm='rm -i'                     # confirmation
alias cp='cp -i'                     # confirmation
alias mv='mv -i'                     # confirmation
alias mkdir='mkdir -p'               # confirmation
alias cd..='cd ..'                   # Command not found?
alias ..='cd ..'                     # Move back one dir
alias ...='cd ../../'                # Move back two dir
alias ....='cd ../../../'            # Move back three dir

## Some shortcuts for different directory listings
alias du='du -ch'                    # Makes a more readable output.
alias df='df -h'                     # Makes a more readable output.
alias l='ls -ah'                     # Quick listing all
alias ll='ls -alhF'                  # Quick listing all, long
alias la='ls -Al'                    # show hidden files
alias chown='chown --preserve-root'  # changing perms on 
alias chmod='chmod --preserve-root'  # changing perms on 
alias chgrp='chgrp --preserve-root'  # changing perms on 
alias less='less -r'                 # raw control characters
alias whence='type -a'               # where, of a sort
