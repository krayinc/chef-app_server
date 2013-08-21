rbenv_gem 'god'

directory '/etc/god/conf.d' do
  mode 00755
  recursive true
end

template "/etc/god/conf.d/#{node.name}-#{node.chef_environment}.conf" do
  source 'app_monitor.erb'
  mode 00644
end
