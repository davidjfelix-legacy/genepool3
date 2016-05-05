
include_recipe 'adminuser::default'

directory '/opt/' do
  owner node['adminuser']['username']
  group node['adminuser']['group']
  mode 755
  action :create
end

