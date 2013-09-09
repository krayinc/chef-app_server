include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

rbenv_ruby node[:app_server][:ruby][:version] do
  global true
end

if node[:app_server][:ruby][:versions]
  node[:app_server][:ruby][:versions].each do |version|
    rbenv_ruby version do
      global true
    end
  end
end

(node[:app_server][:ruby][:gems] | ['bundler']).each do |gem|
  rbenv_gem gem
end
