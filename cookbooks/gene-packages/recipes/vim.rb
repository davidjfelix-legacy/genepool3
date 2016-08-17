if node['platform_family'] == 'mac_os_x'
  include_recipe 'gene-homebrew'
end

if node['platform_family'] == 'windows'
  # Rely on gvim within Windows. In the future, msysgit, cygwin or another strategy could provide vim
  #TODO: warn that gvim is installed here
  include_recipe 'gene-packages::gvim'
else 
  package 'Install vim' do
    case node['platform_family']
    when 'alpine', 'arch', 'gentoo', 'mac_os_x', 'rhel'
      package_name 'vim'
    when 'debian'
      package_name 'vim-gtk'
    end
end
