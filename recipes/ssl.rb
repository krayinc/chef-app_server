# usage:
#
# 1. mkdir /nginx_root/app-server-conf.d
# 2. put your pem at /nginx_root/app_server.pem
# 3. put your key at /nginx_root/app_server.key
# 4. include_recipe this

template "#{node[:nginx][:dir]}/app-server-conf.d/ssl.conf" do
  mode 00644
end
