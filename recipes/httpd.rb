# TODO: Add support for multiple websites

template "/etc/httpd/conf.d/#{node['wordpress_lamp']['site']}.conf" do
  source 'vhost.erb'
  variables({
    ServerAdmin:  node['wordpress_lamp']['vhost']['server_admin'],
    Website:      node['wordpress_lamp']['site'],
    ServerName:   node['wordpress_lamp']['vhost']['server_name'],
    ServerAlias:  node['wordpress_lamp']['vhost']['server_alias'],
    Port:         node['wordpress_lamp']['vhost']['port']
  })
end