#!/usr/bin/env bash

if [ -f /etc/centos-release ];
then
    # temporary workaround until i rebuild my vagrant box to inlude redhat-release
    yum -y install redhat-lsb
fi


if hash lsb_release 2>/dev/null; then
    DISTRIB=`lsb_release -i | awk '{ print $3 }'`
    RELEASE=`lsb_release -r | awk '{ print $2 }'`
elif [[ "`uname`" == 'FreeBSD' ]]; then
    DISTRIB='FreeBSD'
    RELEASE=''
else
    echo "Unknown distro" 1>&2
    DISTRIB="Unknown"
    RELEASE="Unknown"
fi

case "$DISTRIB" in
    Ubuntu)
        export DEBIAN_FRONTEND=noninteractive
        apt-get update > /dev/null
        apt-get -y install vim dos2unix
        apt-get -y remove command-not-found
        ;;
    CentOS)
        yum -y install vim-enhanced dos2unix
        ;;
    *)
        echo "Unknown disto $DISTRIB" 1>&2
        ;;
esac

su -c /home/vagrant/development/dotfiles/install.sh vagrant

PROJECT=$1
COLOR_FG=44
COLOR_BG=70

cat <<EOF > /home/vagrant/.bash_site
export PS1='\033[${COLOR_FG}m\033[${COLOR_BG}m Vagrant - $PROJECT $DISTRIB $RELEASE \033[m\033[m \n[\u \w]\n\$ '
EOF

