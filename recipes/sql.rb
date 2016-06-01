sql_password = Chef::EncryptedDataBagItem.load('mysql', 'password')

cookbook_file 'tmp/sql_dump.sql' do
  source 'sql_dump.sql'
  owner 'ec2-user'
  group 'ec2-user'
  mode '0444'
  action :create
end

bash 'import sql' do
  cwd "/tmp"
  code <<-EOH
  mysql -u root -p#{sql_password['mysql_password']} -e "CREATE DATABASE #{node['wordpress_lamp']['sql']['database']}"
  mysql -u root -p#{sql_password['mysql_password']} -e "GRANT ALL PRIVILEGES ON #{node['wordpress_lamp']['sql']['database']}.* to '#{node['wordpress_lamp']['sql']['database']}'@'#{node['wordpress_lamp']['sql']['database_host']}' IDENTIFIED BY '#{sql_password['mysql_password']}'"
  mysql -u root -p#{sql_password['mysql_password']} #{node['wordpress_lamp']['sql']['database']} < /tmp/sql_dump.sql
  EOH
  only_if { node['wordpress_lamp']['sql']['import_sql']  }
end