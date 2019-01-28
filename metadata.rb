name             'wordpress_lamp'
maintainer       'Jesse Whitham'
maintainer_email 'jesse.whitham@gmail.com'
license          'GPL-3.0'
description      'Installs/Configures wordpress via lamp server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.0'

source_url 'https://github.com/whithajess/wordpress_lamp'
issues_url 'https://github.com/whithajess/wordpress_lamp/issues'

supports 'amazon'

depends 'lamp'

chef_version '>= 12.10.24'
