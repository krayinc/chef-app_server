rbenv_gem 'god'

template "/etc/god/conf.d/#{node.name}-#{node.chef_environment}.conf" do
  source 'app_monitor.erb'
  mode 00644
end
