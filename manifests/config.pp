class kibana3::config {

  htpasswd::user {$kibana3::params::kibana_htpasswd_user:
    file     => $kibana3::params::kibana_htpasswd_file,
    password => $kibana3::params::kibana_htpasswd_pass,
  }

  apache2::site{'kibana3_vhost':
    source  => "${module_name}/web/apache2/kibana.vhost.conf.erb",
    require => Class['roles::apache2_server']
  }

  file{ 'kibana3_config':
    ensure  => present,
    path    => "${kibana3::params::kibana_document_root}/kibana-3.1.0/config.js",
    content => template("${module_name}/config.js.erb"),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
