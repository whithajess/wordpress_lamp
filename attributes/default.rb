# TODO: Add support for multiple websites

default['wordpress_lamp']['site'] = 'test'
default['wordpress_lamp']['vhost']['server_admin'] = 'root@localhost'
default['wordpress_lamp']['vhost']['server_name'] = 'test.com'
default['wordpress_lamp']['vhost']['server_alias'] = 'www.test.com'
default['wordpress_lamp']['vhost']['port'] = '80'

default['wordpress_lamp']['sql']['import_sql']       = true
default['wordpress_lamp']['sql']['database']         = 'test_db'
default['wordpress_lamp']['sql']['database_host']    = 'localhost'