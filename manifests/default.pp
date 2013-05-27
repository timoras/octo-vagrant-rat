 /*  include postgresql::server */
class { 'postgresql::server':
  config_hash => {
    'ip_mask_deny_postgres_user' => '0.0.0.0/32',
    'ip_mask_allow_all_users'    => '0.0.0.0/0',
    'listen_addresses'           => '*',
    'ipv4acls'                   => ['hostssl all johndoe 192.168.0.0/24 cert'],
    'manage_redhat_firewall'     => true,
    'postgres_password'          => 'TPSrep0rt!',
  },
}

/*class { 'postgresql':

}*/
/*-> class { 'postgresql::server':
}*/


/*
$reqPackages = [ "postgresql84-server" ]

package { 
    $reqPackages: ensure => "installed"
} */

postgresql::db { 'junit':
  user     => 'aa',
  password => 'aa'
}



