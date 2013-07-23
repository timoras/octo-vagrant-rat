Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

package { 'wget':
    ensure => 'installed'   
}~>
exec { 'download_gerrit':
    command => "wget -q http://gerrit-releases.storage.googleapis.com/gerrit-2.6.1.war",
    creates => "/home/vagrant/gerrit-2.6.1.war"
}~>
exec {'gerrit_init':
    command => "java -jar /home/vagrant/gerrit-2.6.1.war init"
}




