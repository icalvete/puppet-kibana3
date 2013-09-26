class kibana3 (

  $webserver_user  = $kibana3::params::webserver_user,
  $webserver_group = $kibana3::params::webserver_group,
  $repo_scheme     = $kibana3::params::repo_scheme,
  $repo_domain     = $kibana3::params::repo_domain,
  $repo_port       = $kibana3::params::repo_port,
  $repo_user       = $kibana3::params::repo_user,
  $repo_pass       = $kibana3::params::repo_pass,
  $repo_path       = $kibana3::params::repo_path,
  $repo_resource   = $kibana3::params::package

) inherits kibana3::params {

  anchor {'kibana3::begin':
    before => Class['kibana3::install']
  }

  class {'kibana3::install':
    require => Anchor['kibana3::begin']
  }

  class {'kibana3::config':
    require => Class['kibana3::install']
  }

  anchor {'kibana3::end':
    require => Class['kibana3::config']
  }
}
