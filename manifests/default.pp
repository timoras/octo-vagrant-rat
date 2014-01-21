class { 'postgresql::globals':
  version => '8.4'
}->
class { 'postgresql::server':
  ip_mask_deny_postgres_user => '0.0.0.0/32',
  ip_mask_allow_all_users    => '0.0.0.0/0',
  listen_addresses           => '*'

}

postgresql::server::db { 'junit':
  user     => 'junituser',
  password => 'junituser'
}


postgresql::pg_hba_rule { 'allow postgres user to access any database':
    description => 'allow postgres user to access any database',
    type => 'local',
    database => 'all',
    user => 'postgres',
    auth_method => 'ident',
    order => '000',
}


