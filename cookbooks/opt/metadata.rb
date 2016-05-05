name 'opt'
maintainer 'David J Felix'
maintainer_email 'felix.davidj@gmail.com'
license 'MIT'
description 'Installs/Configures opt'
long_description 'Installs/Configures opt'
version '0.1.0'

depends 'adminuser', '~> 0.1.0'

%w(alpine amazon arch centos debian fedora freebsd gentoo mac_os_x mac_os_x_server oracle redhat scientific slackware ubuntu).each do |os|
  supports os
end

