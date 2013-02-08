#
# Cookbook Name:: app-server
# Recipe:: default
#
# Copyright 2013, KRAY Inc.
#
# All rights reserved - Do Not Redistribute
#
require_recipe 'ntp'

execute "install_bundler" do
  command "gem i bundler --no-ri --no-rdoc"
  not_if { begin Gem::Specification.find_by_name('bundler'); rescue Gem::LoadError => e; false end }
end
