# wordpress_lamp Cookbook
[![Cookbook Version](https://img.shields.io/cookbook/v/wordpress_lamp.svg?style=flat)](https://supermarket.chef.io/cookbooks/wordpress_lamp)
[![Dependency Status](http://img.shields.io/gemnasium/whithajess/wordpress_lamp.svg?style=flat)](https://gemnasium.com/whithajess/wordpress_lamp)
[![License](https://img.shields.io/github/license/whithajess/wordpress_lamp.svg)](https://www.gnu.org/licenses/gpl.txt)

This cookbook is for creating a usable wordpress with lamp install on your host.

It will not handle deployment of the application specific code it is setup for capistrano deploys.

## Requirements

You will need to create encrypted data bags on the server for the mysql password and wordpress keys and salts.

- Create a data bag "mysql" with item "password", store your root password there with the json flag "mysql_password"

- Create a data bag "wordpress" with item "salts", store your salts and keys there under these json flags:
    "auth_key"
    "secure_auth_key"
    "logged_in_key"
    "nonce_key"
    "auth_salt"
    "secure_auth_salt"
    "logged_in_salt"
    "nonce_salt"

### Supported Platforms

- Amazon Linux

### Chef

- Chef 12.0 or later

### Cookbooks

- `lamp` - wordpress_lamp uses lamp for that part of the install

## Attributes

### wordpress_lamp::default

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['wordpress_lamp']['site']</tt></td>
    <td>String</td>
    <td>Name of site</td>
    <td><tt>test</tt></td>
  </tr>
  <tr>
    <td><tt>['wordpress_lamp']['vhost']['server_admin']</tt></td>
    <td>String</td>
    <td>Name of server admin for vhost</td>
    <td><tt>root@localhost</tt></td>
  </tr>
  <tr>  
    <td><tt>['wordpress_lamp']['vhost']['server_name']</tt></td>
    <td>String</td>
    <td>Apache server name</td>
    <td><tt>test.com</tt></td>
  </tr>
  <tr>  
    <td><tt>['wordpress_lamp']['vhost']['server_alias']</tt></td>
    <td>String</td>
    <td>Apache server alias</td>
    <td><tt>www.test.com</tt></td>
  </tr>
  <tr>  
    <td><tt>['wordpress_lamp']['vhost']['port']</tt></td>
    <td>Int</td>
    <td>What port to run Apache server on</td>
    <td><tt>80</tt></td>
  </tr>
  <tr>  
    <td><tt>['wordpress_lamp']['sql']['import_sql']</tt></td>
    <td>Boolean</td>
    <td>Whether to import sql from dump</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>  
    <td><tt>['wordpress_lamp']['sql']['database']</tt></td>
    <td>String</td>
    <td>Database Name</td>
    <td><tt>test_db</tt></td>
  </tr>  
  <tr>  
    <td><tt>['wordpress_lamp']['sql']['database_host']</tt></td>
    <td>String</td>
    <td>Database host</td>
    <td><tt>localhost</tt></td>            
  </tr>
</table>

## Usage

### wordpress_lamp::default

Just include `wordpress_lamp` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[wordpress_lamp::default]"
  ]
}
```

## Testing

Test using kitchen

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors

Authors: Jesse Whitham (jesse.whitham@gmail.com)
License: GNU GPL v3

Heavily based from https://github.com/Kgirthofer/s3_wordpress
and dependent on https://github.com/Kgirthofer/lamp
