# prerequisite files:
# - /var/www/<node.name>/<node.chef_environment>/.htpasswd

# attributes:
node.default[:app_server][:admin_auth][:authorized_hosts] = %w[60.32.78.18]

service 'nginx' do
  supports :reload => true
end

template "#{node[:nginx][:dir]}/app-server-conf.d/admin_auth.conf" do
  mode 00644
  notifies :reload, 'service[nginx]'
end
