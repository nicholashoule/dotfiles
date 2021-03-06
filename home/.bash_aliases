# System aliases
#-----------------------------------------------
# color support of ls and also add handy aliases
#-----------------------------------------------
# Detect which `ls` flavor is in use
# if ls --color > /dev/null 2>&1; then # GNU `ls`
# 	colorflag='--color=always'
# else # OS X `ls`
# 	colorflag="-G"
# fi
colorflag='--color=always'

# Some shortcuts for different directory listings
alias ls="command ls -hF ${colorflag}"                      # Always use color output for `ls`
alias l="ls -lF ${colorflag}"                               # List all files colorized in long format
alias l.="ls -d .* ${colorflag}"
alias ll="ls -aF ${colorflag}"
alias lll="ls -laF ${colorflag}"
alias la="ls -laF ${colorflag}"                             # List all files colorized in long format, including dot files
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"   # List only directories
alias dir="ls ${colorflag} --format=vertical"
alias vdir="ls ${colorflag} --format=long"

export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

#-----------------------------------------------
# Helper alias(s) here
#-----------------------------------------------
alias sudo='sudo '                   # Enable aliases to be sudo’ed
alias tree='tree -C'                 # Pretty color tree
alias path='echo -e ${PATH//:/\\n}'  # Pretty path

# Empty the Trash on all mounted volumes and the main HDD
alias emptytrash="sudo shred -fuz ~/.local/share/Trash/files/*"
alias emptyall="sudo shred -fuz /var/tmp/* && sudo shred -fuz ~/.local/share/Trash/files/*"

#-----------------------------------------------
# Application alias(s) here
#-----------------------------------------------
# Vim aliases
alias vi='vim'                                  # Ensure Vi IMproved
alias PluginInstall="vim +PluginInstall +qall"  # Quick PluginInstall
alias plugininstall='PluginInstall'             # Quick PluginInstall
alias pi='PluginInstall'                        # Quick PluginInstall

# Vim GitHub plugins
alias vundle='bash.utils.find_git_repo https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim'

# View HTTP traffic
#alias sniff="sudo netstat -tauw"
#alias httpdump="sudo tcpdump -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
#alias httpdump="sudo tcpdump -n -s 0 -w -"

# Puppet aliases
#alias puppet-lint='puppet-lint --log-format="%{path} - %{KIND}:%{check} - %{message} on line %{line}"'
#alias izgood="puppet parser validate"
#alias izpretty='puppet-lint'

# Vagrant aliases
# https://www.vagrantup.com/downloads.html
#alias v='vagrant'
#alias vs='vagrant status'
#alias vhl='vagrant hosts list'

# Tmux aliases
alias tma='tmux attach -d -t'

# Bundler aliases
alias b='bundle'
alias be='bundle exec'
alias bi='bundle install'

# RVM Install
# https://rvm.io/rvm/install
alias rvmgpg2Import='\curl -sSL https://rvm.io/mpapis.asc | sudo gpg2 --import -'
alias rvmInstall='rvmgpg2Import \curl -sSL https://rvm.io/mpapis.asc | sudo gpg2 --import -'

# Git and Github aliases
alias cdg='cd "$(git rev-parse --show-toplevel)"'
# Git GitHub git-completion.bash
alias gitbash='curl -o ~/.bash_completion.d/git-completion.bash -L https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash'

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias "$method"="lwp-request -m '$method'"
done

#-----------------------------------------------
# Other alias(s) here (shortcuts)
#-----------------------------------------------
alias mount='mount | column -t'      # Make mount command output pretty and human readable
alias rm='rm -i'                     # confirmation
alias cp='cp -i'                     # confirmation
alias mv='mv -i'                     # confirmation
alias mkdir='mkdir -p'               # confirmation
alias cd..='cd ..'                   # Command not found?
alias ..='cd ..'                     # Move back one dir
alias ...='cd ../../'                # Move back two dir
alias ....='cd ../../../'            # Move back three dir
alias du='du -ch'                    # Makes a more readable output.
alias df='df -h'                     # Makes a more readable output.
alias chown='chown --preserve-root'  # changing perms on
alias chmod='chmod --preserve-root'  # changing perms on
alias chgrp='chgrp --preserve-root'  # changing perms on
alias less='less -r'                 # raw control characters
alias whence='type -a'               # where, of a sort

# Golang
# https://dl.google.com/go/go1.13.1.linux-amd64.tar.gz
# tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
tVERSION='1.13.1'
tOS='linux'
tARCH='amd64'
alias goget="curl -o /tmp/go${tVERSION}.tar.gz https://dl.google.com/go/go${tVERSION}.${tOS}-${tARCH}.tar.gz"
alias goinstall="tar -C /usr/local -xzf /tmp/go${tVERSION}.tar.gz" 
alias gosetup="mkdir -p ${HOME}/go/{src/github.com,bin,pkg}"

# Docker
# https://get.docker.com
# sudo usermod -aG docker your-user
alias getdocker="curl -fsSL https://get.docker.com -o /tmp/get-docker.sh"
alias installdocker="sh /tmp/get-docker.sh"

# Secure DNS using unbound
# Requirtes Docker CE
alias securedns="sudo docker container run --rm -it --name unboud-cloud 181gaming/unbound:1.6"
