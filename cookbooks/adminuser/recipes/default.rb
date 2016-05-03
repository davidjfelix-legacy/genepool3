#
# Cookbook Name:: adminuser
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

user node['adminuser']['username'] do
  comment 'An administrative user used for the hatchery setup'
  manage_home false
  system true
  action :create
end

group node['adminuser']['group'] do
  append true
  members node['adminuser']['username']
  action :modify
end

