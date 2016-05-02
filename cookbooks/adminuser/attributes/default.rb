default['adminuser']['username'] = 'splicer'

case node['platform']
when 'debian', 'ubuntu'
  default['adminuser']['group'] = 'sudo'
when 'mac_os_x'
  default['adminuser']['group'] = 'admin'
when 'alpine', 'amazon', 'arch', 'centos', 'fedora', 'freebsd', 'gentoo', 'oracle', 'redhat', 'scientific', 'slackware'
  default['adminuser']['group'] = 'wheel'
when 'windows'
  default['adminuser']['group'] = 'Administrators'
