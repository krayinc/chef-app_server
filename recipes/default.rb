#
# Cookbook Name:: app-server
# Recipe:: default
#
# Copyright 2013, KRAY Inc.
#
# All rights reserved - Do Not Redistribute
#
execute "install_bundler" do
  command "gem i bundler --no-ri --no-rdoc"
end
