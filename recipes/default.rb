#
# Cookbook Name:: app-server
# Recipe:: default
#
# Copyright 2013, KRAY Inc.
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'ntp'
include_recipe 'nginx'

directory node['app_server']['log_path'] do
  mode 00775
  recursive true
end

directory "#{node['nginx']['dir']}/app-server-conf.d" do
  mode 00775
end

cookbook_file "#{node['nginx']['dir']}/conf.d/log_formats.conf" do
  source 'log_formats.conf'
  owner 'root'
  group 'root'
  mode 00644
end

confs = %w[proxy]
confs << 'ssl' if node[:app_server][:use_ssl]
confs.each do |conf|
  template "#{node['nginx']['dir']}/app-server-conf.d/#{conf}.conf" do
    mode 00644
  end
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
