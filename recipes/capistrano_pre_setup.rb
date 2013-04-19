directory node['app_server']['capistrano_pre_setup']['deploy_to'] do
  owner node['app_server']['capistrano_pre_setup']['owner']
  group node['app_server']['capistrano_pre_setup']['group']
  mode 00775
  recursive true
end

%w[shared shared/assets shared/log].each do |dir|
  directory "#{node['app_server']['capistrano_pre_setup']['deploy_to']}/#{dir}" do
    owner node['app_server']['capistrano_pre_setup']['owner']
    group node['app_server']['capistrano_pre_setup']['group']
    mode 00775
  end
end
