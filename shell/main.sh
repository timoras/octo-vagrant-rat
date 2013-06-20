#!/bin/sh -e

# Directory in which librarian-puppet should manage its modules directory
PUPPET_DIR=/etc/puppet/
mkdir -p $PUPPET_DIR 
# NB: librarian-puppet might need git installed. If it is not already installed
# in your basebox, this will manually install it at this point using apt or yum
GIT=/usr/bin/git
YUM=/usr/sbin/yum

if [ ! -x $GIT ]; then
    yum -q -y makecache
    yum -q -y install git
  
fi

cp /vagrant/puppet/Puppetfile $PUPPET_DIR

if [ "$(gem search -i librarian-puppet)" = "false" ]; then
  gem install librarian-puppet --no-ri --no-rdoc
  cd $PUPPET_DIR && librarian-puppet install --clean
else
  cd $PUPPET_DIR && librarian-puppet update
fi
