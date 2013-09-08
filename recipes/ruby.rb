include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

rbenv_ruby node[:app_server][:ruby][:version] do
  global true
end

(node[:app_server][:ruby][:gems] | ['bundler']).each do |gem|
  rbenv_gem gem
end
