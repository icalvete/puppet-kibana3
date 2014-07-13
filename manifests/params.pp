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

  $elasticsearch_server = '"+window.location.hostname+"'
  $kibana_document_root = hiera('kibana_document_root')
  $kibana_htpasswd_file = hiera('htpasswd_file')
  $kibana_htpasswd_user = hiera('kibana_user')
  $kibana_htpasswd_pass = hiera('kibana_pass')

  $config_file          = 'config.js'

  $elasticsearch_server_auth = false
  $elasticsearch_user        = hiera('kibana_user')
  $elasticsearch_user_pass   = hiera('kibana_pass')
}
