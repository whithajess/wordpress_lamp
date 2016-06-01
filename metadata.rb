name             'wordpress_lamp'
maintainer       'Jesse Whitham'
maintainer_email 'jesse.whitham@gmail.com'
license          'GNU GPL v3'
description      'Installs/Configures wordpress via lamp server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.0'

supports 'amazon'

depends 'lamp'

source_url 'https://github.com/whithajess/wordpress_lamp'
issues_url 'https://github.com/whithajess/wordpress_lamp/issues'