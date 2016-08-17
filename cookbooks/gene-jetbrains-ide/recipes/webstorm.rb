case node['platform_family']
when 'mac_os_x'
  include_recipe 'gene-homebrew'
  homebrew_cask 'webstorm'
when 'alpine', 'arch', 'debian', 'fedora', 'gentoo', 'rhel'
  include_recipe 'gene-opt'
  include_recipe 'gene-jetbrains-ide::opt-jetbrains'
  include_recipe 'gene-java'

  version = node['gene-jetbrains-ide']['webstorm-version']
  install_path = "/opt/jetbrains-ide/webstorm-#{version}"

  remote_file "#{Chef::Config[:file_cache_path]}/webstorm-#{version}.tar.gz" do
    source "#{node['gene-jetbrains-ide']['base_webstorm_url']}/webstorm-#{version}.tar.gz"
    checksum node['gene-jetbrains-ide']['webstorm-checksum']
    mode '0755'
  end

  bash 'Install webstorm' do
    cwd Chef::Config[:file_cache_path]
    code <<-EOF
      rm -rf /opt/jetbrains-ide/webstorm-#{version}
      tar xf webstorm-#{version}.tar.gz -C /opt/jetbrains-ide
    EOF
  end
end
