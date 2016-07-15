name 'gene-homebrew'
maintainer 'David J Felix'
maintainer_email 'felix.davidj@gmail.com'
license 'MIT'
description 'Installs/Configures homebrew for genepool'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'

supports 'mac_osx'

depends 'adminuser', '~> 0.1.0'
depends 'homebrew', '~> 2.1.0'
