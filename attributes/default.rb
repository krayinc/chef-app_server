deploy_to = "/var/www/#{node.name}/#{node.chef_environment}"

default[:app_server][:log_path] = "#{deploy_to}/shared/log"
default[:app_server][:root]     = "#{deploy_to}/current/public"
default[:app_server][:server_name] = node.name
default[:app_server][:sock] = "unix:/tmp/#{node.name}-#{node.chef_environment}.sock"

default[:app_server][:capistrano_pre_setup][:deploy_to] = deploy_to

default[:app_server][:ruby][:version] = '2.0.0-p247'
default[:app_server][:ruby][:gems] = []
