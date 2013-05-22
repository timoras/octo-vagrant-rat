include apt
include jenkins

apt::ppa { "ppa:webupd8team/java": 
}

exec { 'apt-get update':
  command => '/usr/bin/apt-get update',
  require => Apt::Ppa["ppa:webupd8team/java"]
}


$jenkinsPlugins = ['git', 'git-server', 'jenkow-plugin' , 'async-job', 'database', 'git-client', 'jenkow-activiti-designer', 'jenkow-activiti-explorer']
jenkins::plugin { $jenkinsPlugins:
    notify => Class[jenkins::service]
}

exec {
  "accept_license":
  command => "echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections && echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections",
  cwd => "/home/vagrant",
  user => "vagrant",
  path => "/usr/bin/:/bin/",
  before => Package["oracle-java7-installer"],
  logoutput => true,
}

$reqPackages = [ "git-core", "git-gui"]
package { 
    $reqPackages: ensure => "installed"
}

package { "oracle-java7-installer":
    ensure => "installed",
    require => Exec["apt-get update"]
}

package { "maven":
    ensure => "installed",
    before => Package["oracle-java7-installer"]
}


