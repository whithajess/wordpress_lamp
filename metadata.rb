name             'wordpress_lamp'
maintainer       'Jesse Whitham'
maintainer_email 'jesse.whitham@gmail.com'
license          'GNU GPL v3'
description      'Installs/Configures wordpress via lamp server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'amazon'

depends 'lamp'
depends 'aws'