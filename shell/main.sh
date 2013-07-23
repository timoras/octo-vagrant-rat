#!/bin/sh -e 

# Directory in which librarian-puppet should manage its modules directory
PUPPET_DIR=/etc/puppet/
mkdir -p $PUPPET_DIR 
# NB: librarian-puppet might need git installed. If it is not already installed
# in your basebox, this will manually install it at this point using apt or yum
GIT=/usr/bin/git
APT_GET=/usr/bin/apt-get
YUM=/usr/sbin/yum
if [ ! -x $GIT ]; then    
	apt-get -q -y update
    apt-get -q -y install git    
fi

cp /vagrant/puppet/Puppetfile $PUPPET_DIR

if [ "$(gem search -i librarian-puppet)" = "false" ]; then
  gem install librarian-puppet
  cd $PUPPET_DIR && librarian-puppet install --clean
else
  cd $PUPPET_DIR && librarian-puppet update
fi



if [ ! -d /opt/gerrit ]; then    
   mkdir /opt/gerrit
   chmod 777 /opt/gerrit
fi

if [ ! -d /opt/gerrit/review_site ]; then    
   mkdir /opt/gerrit/review_site
   chmod 777 /opt/gerrit/review_site
fi


