name 'adminuser'
maintainer 'David J Felix'
maintainer_email 'felix.davidj@gmail.com'
license 'MIT'
description 'Installs/Configures adminuser'
long_description 'Installs/Configures adminuser'
version '0.1.0'

%w(alpine amazon arch centos debian fedora freebsd gentoo mac_os_x oracle redhat scientific slackware ubuntu).each do |os|
  supports os
end
