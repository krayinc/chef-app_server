#
# Cookbook Name:: app-server
# Recipe:: default
#
# Copyright 2013, KRAY Inc.
#
# All rights reserved - Do Not Redistribute
#
require_recipe 'ntp'
require_recipe 'nginx'

execute "install_bundler" do
  command "gem i bundler --no-ri --no-rdoc"
  not_if { begin Gem::Specification.find_by_name('bundler'); rescue Gem::LoadError => e; false end }
end

cookbook_file "#{node['nginx']['dir']}/conf.d/log_formats.conf" do
  source 'log_formats.conf'
  owner 'root'
  group 'root'
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
