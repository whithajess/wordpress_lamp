# TODO: Add support for multiple websites
sql_password = Chef::EncryptedDataBagItem.load('mysql', 'password')

directory "/var/www/#{node['wordpress_lamp']['site']}/" do
  action :create
  owner "ec2-user"
  group "www"
  mode "2775"
end

directory "/var/www/#{node['wordpress_lamp']['site']}/shared/" do
  action :create
  owner "ec2-user"
  group "www"
  mode  "2775"
  recursive true
end

template "/var/www/#{node['wordpress_lamp']['site']}/shared/wp-config.php" do
  source 'wp-config.php.erb'
  notifies :restart, 'service[httpd]', :delayed
  variables({
    DatabasePassword: sql_password['mysql_password'],
    DatabaseName:     node['wordpress_lamp']['sql']['database'],
    DatabaseHost:     node['wordpress_lamp']['sql']['database_host']
  })
end

execute 'chown-var-www' do
  command 'chown -R apache:www /var/www'
  action :create
end

execute 'chmod-var-www-dir' do
  command 'find /var/www -type d -exec sudo chmod 2775 {} \;'
  action :create
end

execute 'chmod-var-www-file' do
  command 'find /var/www -type f -exec sudo chmod 0664 {} \;'
  action :create
end