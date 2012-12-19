exec { 'aptupdate' :
    path => "/usr/bin",
    command => 'apt-get update',
    user => 'root'
}


$reqPackages = [ "subversion", "vim-gtk", "tar", "wget", "git-core", "git-gui" ]
package { $reqPackages: ensure => "installed", require => Exec["aptupdate"] }
exec { "jvmdir":
    path => '/bin:/usr/bin',
    creates => "/usr/lib/jvm",
    command => 'mkdir -p /usr/lib/jvm',
    user => "root"
}

exec { "jdk7" :
    path => '/bin:/usr/bin',
    require => [Package["tar"], Exec["jvmdir"]],
    command => 'tar -xzf /vagrant/jdk-7u10-linux-i586.tar.gz -C /usr/lib/jvm/',
    creates => "/usr/lib/jvm/jdk",
    user => "root"
}

exec { "mvn" :
    path => '/bin:/usr/bin',
    require => [Package["tar"], Package["wget"]],
    command => 'wget -O - "http://apache.mirror.vu.lt/apache/maven/maven-3/3.0.4/binaries/apache-maven-3.0.4-bin.tar.gz" | tar -xvzf - -C /home/vagrant',
    creates => "/home/vagrant/apache-maven-3.0.4"
}

file { "/etc/profile.d/java_home.sh" :
    ensure => 'present',
    source => '/vagrant/scripts/java_home.sh'
}

file { "/etc/profile.d/maven_home.sh" :
    ensure => 'present',
    source => '/vagrant/scripts/maven_home.sh'
}

$jdk_version = '7u3'
$jdk_version_long = "${jdk_version}-b04"
$jdk_rpm_filename = "jdk-${jdk_version}-linux-x64.rpm"
$jdk_rpm_location = "/vagrant-share/apps/${rpm_filename}"

exec { 'oraclejdk7':
     cwd => '/vagrant/scripts',
     command => "wget http://download.oracle.com/otn-pub/java/jdk/${jdk_version_long}/jdk-${jdk_version}-linux-x64.rpm",
     path => '/bin:/usr/bin'
}

