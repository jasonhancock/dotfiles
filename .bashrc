# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

alias ll='ls -l'
alias vi='vim'

# http://blog.edwards-research.com/2010/07/keeping-aliases-with-sudo-sort-of/
alias sudo='sudo '
alias synpp='puppet parser validate'
synerb () {
    erb -x -T - "$@" | ruby -c
}
alias puppet-lint='puppet-lint --with-filename'

if hash lsb_release 2>/dev/null; then
    DISTRIB=`lsb_release -i | awk '{ print $3 }'`
    RELEASE=`lsb_release -r | awk '{ print $2 }'`
elif [[ "`uname`" == 'FreeBSD' ]]; then
    DISTRIB='FreeBSD'
    RELEASE=''
else
    DISTRIB='Mac OS X'
    RELEASE=`sw_vers | grep ProductVersion | awk '{print $2}'`
fi

export PS1='\033[46m\033[30m $DISTRIB $RELEASE $(date +%H:%M:%S) \033[m\033[m \n[\u \w]\n\$ '

alias yum='sudo yum'

# grep .pp files under cwd
ppgrep () {
    find . -name "*.pp" -exec grep "$@" -H {} \;
}

# Shortcut for setting terminal title
title() {
    echo -ne "\\033]0;$@\\007"
}

# Source site-specific definitions
if [ -f ~/.bash_site ]; then
    . ~/.bash_site
fi
