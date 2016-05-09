case node['platform_family']
when 'darwin'
  include_recipe 'gene-homebrew'
  cask_package 'pycharm'
when 'alpine', 'arch', 'debian', 'fedora', 'gentoo', 'rhel'
  include_recipe 'gene-opt'
  include_recipe 'gene-jetbrains-ide::opt-jetbrains'
end
