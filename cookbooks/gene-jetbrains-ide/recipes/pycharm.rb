case node['platform_family']
when 'mac_os_x'
  include_recipe 'gene-homebrew'
  homebrew_cask 'pycharm'
when 'alpine', 'arch', 'debian', 'fedora', 'gentoo', 'rhel'
  include_recipe 'gene-opt'
  include_recipe 'gene-jetbrains-ide::opt-jetbrains'
  include_recipe 'gene-java'

  version = node['gene-jetbrains-ide']['pycharm-version']
  install_path = "/opt/jetbrains-ide/pycharm-#{version}"

  remote_file "#{Chef::Config[:file_cache_path]}/pycharm-#{version}.tar.gz" do
    source "#{node['gene-jetbrains-ide']['base_pycharm_url']}/pycharm-#{version}.tar.gz"
    checksum node['gene-jetbrains-ide']['pycharm-linux-checksum']
    mode '0755'
  end

  bash 'install-pycharm' do
    cwd Chef::Config[:file_cache_path]
    code <<-EOF
      rm -rf /opt/jetbrains-ide/pycharm-#{version}
      tar xf pycharm-#{version}.tar.gz -C /opt/jetbrains-ide
    EOF
  end
when 'windows'
  version = node['gene-jetbrains-ide']['pycharm-version']
  
  remote_file "#{Chef::Config[:file_cache_path}/pycharm-#{version}.exe" do
    source "#{node['gene-jetbrains-ide']['base_pycharm_url']}/pycharm-#{version}.exe"
    checksum node['gene-jetbrains-ide']['pycharm-windows-checksum']
    mode '0755'
  end
  
  execute 'install-pycharm' do
    command "#{Chef::Config[:file_cache_path}/pycharm-#{version}.exe /S"
  end
end
