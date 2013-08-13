directory node[:image_converter][:cache_dir] do
  owner 'nginx'
  group 'nginx'
  mode 00700
  recursive true
end

template "#{node[:nginx][:dir]}/conf.d/proxy_cache.conf" do
  mode 00644
  variables(
    :cache_dir => node[:image_converter][:cache_dir],
  )
end

template "#{node[:nginx][:dir]}/app-server-conf.d/image_converter.conf" do
  mode 00644
  variables(
    :s3_bucket   => node[:image_converter][:s3_bucket],
    :s3_endpoint => node[:image_converter][:s3_endpoint],
  )
end
