package { 'git':
    ensure => 'installed'   
}

exec {'apt-get update':
    path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ]    
}->
package { 'openjdk-7-jdk':
    ensure => 'installed'   
}->
file { "/opt/gerrit": 
   path    => "/opt/gerrit", 
   mode    => 0777
}->
package { 'wget':
    ensure => 'installed'   
}->
exec { 'download_gerrit':
    command => "wget -q http://gerrit-releases.storage.googleapis.com/gerrit-2.6.1.war",
    creates => "/home/vagrant/gerrit-2.6.1.war",
    cwd => "/home/vagrant/",
    path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ]    
}->
exec {'gerrit_init':
    command => "java -jar /home/vagrant/gerrit-2.6.1.war init -D/opt/gerrit",
    path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ]    
}->
file {'/opt/gerrit':
    path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ]    
}




