name             'app-server'
maintainer       'KRAY Inc.'
maintainer_email 'all@kray.jp'
license          'All rights reserved'
description      'Installs/Configures app-server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.1'
depends          'base-server'
depends          'ntp'
depends          'nginx'
depends          'rbenv'
