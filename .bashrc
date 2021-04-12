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
elif [[ -f "/etc/debian_version" ]]; then
    DISTRIB='Debian'
    RELEASE=`cat /etc/debian_version`
elif [[ -f "/etc/centos-release" ]]; then
    DISTRIB='CentOS'
    RELEASE=`grep ^VERSION= /etc/os-release | cut -d '"' -f 2`
else
    DISTRIB='Mac OS X'
    RELEASE=`sw_vers | grep ProductVersion | awk '{print $2}'`

    # highlight the current day in cal's output
    # http://www.commandlinefu.com/commands/view/10933/print-a-monthly-calendar-with-todays-date-highlighted
    alias 'jcal'='cal | grep -E --color "\b`date +%e`\b|$"'
fi

# yellow
# export PS1='\033[43m\033[30m $HOSTNAME $DISTRIB $RELEASE $(date +%H:%M:%S) \033[m\033[m \n[\u \w]\n\$ '
export PS1='\033[46m\033[30m $HOSTNAME $DISTRIB $RELEASE $(date +%H:%M:%S) \033[m\033[m \n[\u \w]\n\$ '

alias yum='sudo yum'
alias weather='curl wttr.in/ONT?u && echo && echo'
alias moon='curl wttr.in/Moon'

# grep .pp files under cwd
ppgrep () {
    find . -name "*.pp" -exec grep "$@" -H {} \;
}

# Shortcut for setting terminal title
title() {
    echo -ne "\\033]0;$@\\007"
}

enc() {
    /opt/puppetlabs/puppet/bin/eyaml encrypt -l "$1" -s "$2"
}

enc_prod() {
    /opt/puppetlabs/puppet/bin/eyaml encrypt --pkcs7-public-key=/vagrant/keys/production.public_key.pkcs7.pem -l "$1" -s "$2"
}

# Strips the last char of a file. Useful for removing newlines
strip_newline () {
  local src=$1
  local tmpfile='/tmp/stripping_newline'
  perl -pe 'chomp if eof' $src > $tmpfile
  mv $tmpfile $src
}

# Source site-specific definitions
if [ -f ~/.bash_site ]; then
    . ~/.bash_site
fi

export EDITOR=vim

alias gs='git status'

batt() {
    pmset -g batt | tail -n 1 | awk '{print $3}' | cut -d ';' -f 1
}

strip_last_newline() {
    perl -pi -e 'chomp if eof' "$1"
}

alias recentbranches="git for-each-ref --sort=-committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) - (%(color:green)%(committerdate:relative)%(color:reset))' --count 10"
alias fix_author='git commit --amend --author="Jason Hancock <jason@jasonhancock.com>"'

# install github.com/rakyll/gotest
alias gt='gotest -v -tags=int'

function check_ssl() {
    local host=$1
    local port=$2

    if [ -z "$host" ]; then
        echo "host not specified"
        return
    fi

    if [ -z "$port" ]; then
        echo "port not specified"
        return
    fi

    echo | openssl s_client -servername $host -connect $host:$port 2>/dev/null | openssl x509 -noout -enddate
}

alias vim_spell_update="vim -c ':mkspell! ~/.vim/spell/en.utf-8.add' -c ':q!'"

# full logs from Docker's BuildKit
export BUILDKIT_PROGRESS=plain

# from https://twitter.com/fatih/status/1381555413083168769
# cd to the root of a git repo from within the repo
alias cdr="cd $(git rev-parse --show-toplevel)"
