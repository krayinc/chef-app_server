package 'fcgi-devel'
package 'spawn-fcgi'

bash 'install_fcgiwrap' do
  cwd '/usr/local/src'
  code <<-END
    git clone https://github.com/gnosek/fcgiwrap.git
    cd fcgiwrap
    autoreconf -i
    ./configure
    make
    make install
  END
  not_if { File.exist? '/usr/local/sbin/fcgiwrap' }
end

template '/etc/sysconfig/spawn-fcgi'

service 'spawn-fcgi' do
  action [:enable, :start]
end

service 'nginx' do
  supports :reload => true
end

template "#{node[:nginx][:dir]}/app-server-conf.d/fcgi.conf" do
  mode 00644
  notifies :reload, 'service[nginx]'
end
