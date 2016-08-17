#TODO: alpine needs to error here

if node['platform_family'] == 'mac_os_x'
  include_recipe 'gene-homebrew'
end

if node['platform_family'] == 'windows'
  version = node['gene-packages']['gvim-version']
  remote_file "#{Chef::Config[:file_cache_path]}/gvim-#{version}.exe" do
    source "#{node['gene-packages']['gvim-windows-url']}"
    mode '0755'
  end

  execute 'Install gvim' do
    command "#{Chef::Config[:file_cache_path]}/gvim-#{version}.exe /TYPE=FULL /S /DD"
  end
else 
  package 'Install gvim' do
    case node['platform_family']
    when 'arch', 'debian', 'gentoo', 'rhel'
      package_name 'gvim'
    when 'mac_os_x'
      # TODO: warn that macvim is being installed
      package_name 'macvim'
    end
end
