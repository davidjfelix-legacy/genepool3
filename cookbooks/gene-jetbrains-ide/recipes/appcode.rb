case node['platform_family']
when 'mac_os_x'
  include_recipe 'gene-homebrew'
  homebrew_cask 'appcode'
when 'alpine', 'arch', 'debian', 'fedora', 'gentoo', 'rhel', 'windows'
  # Appcode requires OSX
end
