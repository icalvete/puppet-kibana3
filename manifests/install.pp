class kibana3::install {

  file {$kibana3::params::kibana_document_root:
    ensure => directory,
    owner  => $kibana3::webserver_user,
    group  => $kibana3::webserver_group,
    mode   => '0700'
  }

  common::down_resource {'kibana3_get_package':
    scheme   => $kibana3::repo_scheme,
    domain   => $kibana3::repo_domain,
    port     => $kibana3::repo_port,
    user     => $kibana3::repo_user,
    pass     => $kibana3::repo_pass,
    path     => $kibana3::repo_path,
    resource => $kibana3::repo_resource,
    require  => File[$kibana3::params::kibana_document_root]
  }

  exec {'kibana3_install_package':
    cwd     => $kibana3::params::kibana_document_root,
    command => "/bin/tar xfz /tmp/${kibana3::repo_resource}",
    require => Common::Down_resource['kibana3_get_package'],
    unless  => "/usr/bin/test -f ${kibana3::params::kibana_document_root}/kibana-master/src/${kibana3::params::config_file}"
  }
}
