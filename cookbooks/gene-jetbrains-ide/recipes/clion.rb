case node['platform_family']
when 'mac_os_x'
  include_recipe 'gene-homebrew'
  homebrew_cask 'clion'
when 'alpine', 'arch', 'debian', 'fedora', 'gentoo', 'rhel'
  include_recipe 'gene-opt'
  include_recipe 'gene-jetbrains-ide::opt-jetbrains'
  include_recipe 'gene-java'

  version = node['gene-jetbrains-ide']['clion-version']
  install_path = "/opt/jetbrains-ide/clion-#{version}"

  remote_file "#{Chef::Config[:file_cache_path]}/clion-#{version}.tar.gz" do
    source "#{node['gene-jetbrains-ide']['base-clion-url']}/clion-#{version}.tar.gz"
    checksum node['gene-jetbrains-ide']['clion-linux-checksum']
    mode '0755'
  end

  bash 'install-clion' do
    cwd Chef::Config[:file_cache_path]
    code <<-EOF
      rm -rf /opt/jetbrains-ide/clion-#{version}
      tar xf clion-#{version}.tar.gz -C /opt/jetbrains-ide
    EOF
  end
when 'windows'
  version = node['gene-jetbrains-ide']['clion-version']
  
  remote_file "#{Chef::Config[:file_cache_path}/clion-#{version}.exe" do
    source "#{node['gene-jetbrains-ide']['base-clion-url']}/clion-#{version}.exe"
    checksum node['gene-jetbrains-ide']['clion-windows-checksum']
    mode '0755'
  end
  
  execute 'install-clion' do
    command "#{Chef::Config[:file_cache_path}/clion-#{version}.exe /S"
  end
end
