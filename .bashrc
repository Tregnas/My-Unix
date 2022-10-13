# Shortcuts and prettifyers
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'
alias ip4='ip -4 a'
alias ll='ls -alh'
alias la='ls -A --color=auto'
alias now='date +"%T"'
alias svim='sudo vim'
alias rpmi='rpm -ivh'
alias mount='mount |column -t'

# Netstat: most wanted
alias ports='netstat -tulanp'
alias ifaces='netstat -i'
alias listen='netstat -l'

# Simplifying prompt colors
oldps1="$PS1"
red=$(tput setaf 1)
green=$(tput setaf 2)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
reset=$(tput sgr0)

# Resetting prompt colors
export PS1='\[$cyan\]\u\[$green\][\h]\[$reset\]:\[$blue\]\w\[$reset\]\$ '

# Adding timestamps to history
export HISTTIMEFORMAT="%d/%m/%y %T "

# Show me the size (sorted) of only the folders in this directory
alias folders='find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn'

# Recursively scan dir to find exact substring and show me the matches
alias rsfind='find . -type f -exec grep -H $1 {} \;'

# Show config file without comments and empty lines
alias strip='grep -v ^# $1 | egrep -v ^$ | grep'

# Generate alnum password
alias pwgen="tr -cd '[:alnum:]' < /dev/urandom | fold -w12 | head -n1"

# Generate odd password
alias pwgena="tr -cd '[:graph:]' < /dev/urandom | fold -w12 | head -c 18"

# Extract some types of achieves
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       tar xvjf $1     ;;
           *.gz)        tar xzvf $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
