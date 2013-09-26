class kibana3::config {

  htpasswd::user {$kibana3::params::kibana_htpasswd_user:
    file     => $kibana3::params::kibana_htpasswd_file,
    password => $kibana3::params::kibana_htpasswd_pass,
  }

  file{ 'kibana3_vhost':
    ensure  => present,
    path    => "${apache2::params::apache2_ensites}/kibana.vhost",
    content => template("${module_name}/kibana.vhost.erb"),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  file{ 'kibana3_config':
    ensure  => present,
    path    => "${kibana3::params::kibana_document_root}/kibana-master/src/config.js",
    content => template("${module_name}/config.js.erb"),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
