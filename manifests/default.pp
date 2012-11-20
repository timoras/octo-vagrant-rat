exec { 'apt-get update':
    command => '/usr/bin/apt-get update'
}
$enhancers = [ "git-core", "git-gui", "vim-gtk"]
package { $enhancers: ensure => "installed" }
