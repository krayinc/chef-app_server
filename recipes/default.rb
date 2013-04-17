#
# Cookbook Name:: app-server
# Recipe:: default
#
# Copyright 2013, KRAY Inc.
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'base-server'
include_recipe 'ntp'
include_recipe 'nginx'

execute "install_bundler" do
  command "gem i bundler --no-ri --no-rdoc"
  not_if { begin Gem::Specification.find_by_name('bundler'); rescue Gem::LoadError => e; false end }
end

directory node['app_server']['log_path'] do
  mode 00775
  recursive true
end

cookbook_file "#{node['nginx']['dir']}/conf.d/log_formats.conf" do
  source 'log_formats.conf'
  owner 'root'
  group 'root'
  mode 00644
end

template "#{node['nginx']['dir']}/ssl" do
  source 'ssl.erb'
  mode 00644
end

template "#{node['nginx']['dir']}/sites-available/app-server" do
  source 'app-server.erb'
  owner 'root'
  group 'root'
  mode 00644
  notifies :reload, 'service[nginx]'
end

nginx_site 'app-server' do
  enable true
end

template '/etc/iptables.d/webserver' do
  source 'webserver.erb'
  owner 'root'
  group 'root'
  mode 00644
  notifies :run, resources(:execute => 'rebuild-iptables')
end
