case node['platform_family']
when 'mac_os_x'
  include_recipe 'gene-homebrew'
  homebrew_cask 'rubymine'
when 'alpine', 'arch', 'debian', 'fedora', 'gentoo', 'rhel'
  include_recipe 'gene-opt'
  include_recipe 'gene-jetbrains-ide::opt-jetbrains'
  include_recipe 'gene-java'

  version = node['gene-jetbrains-ide']['rubymine-version']
  install_path = "/opt/jetbrains-ide/rubymine-#{version}"

  remote_file "#{Chef::Config[:file_cache_path]}/rubymine-#{version}.tar.gz" do
    source "#{node['gene-jetbrains-ide']['base_rubymine']}/rubymine-#{version}.tar.gz"
    checksum node['gene-jetbrains-ide']['rubymine-checksum']
    mode '0755'
  end

  bash 'Install rubymine' do
    cwd Chef::Config[:file_cache_path]
    code <<-EOF
      rm -rf /opt/jetbrains-ide/rubymine-#{version}
      tar xf rubymine-#{version}.tar.gz -C /opt/jetbrains-ide
    EOF
  end
end
