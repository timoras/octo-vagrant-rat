class { 'postgresql':
  charset => 'UTF8',
  locale  => 'en_NG',
  version => '8.4',
}->
class { 'postgresql::server':
    config_hash => {
        'ip_mask_deny_postgres_user' => '0.0.0.0/32',
        'ip_mask_allow_all_users'    => '0.0.0.0/0',
        'listen_addresses'           => '*',
        'manage_redhat_firewall'     => true,
    }
}

postgresql::db { 'junit':
  user     => 'junituser',
  password => 'junituser'
}



