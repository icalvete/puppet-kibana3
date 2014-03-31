class kibana3::params {

  $webserver_user       = 'www-data'
  $webserver_group      = 'www-data'

  $org_domain           = hiera('org_domain')

  $repo_scheme          = hiera('sp_repo_scheme')
  $repo_domain          = hiera('sp_repo_domain')
  $repo_port            = hiera('sp_repo_port')
  $repo_user            = hiera('sp_repo_user')
  $repo_pass            = hiera('sp_repo_pass')
  $repo_path            = hiera('sp_repo_path')
  $package              = hiera('kibana_package')

  $elasticsearch_server = hiera('elasticsearch_vip')
  $kibana_document_root = hiera('kibana_document_root')
  $kibana_htpasswd_file = hiera('htpasswd_file')
  $kibana_htpasswd_user = 'kibana'
  $kibana_htpasswd_pass = 'k1b4n4'

  $config_file          = 'config.js'
}
