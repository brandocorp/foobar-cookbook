#
# Cookbook Name:: foobar
# Recipe:: default
#
# Copyright (C) 2014
#
#
#

# required by the foobar application for foobaring things
package 'telnet'

# the foobar application's installation folder
directory node['foobar']['home_dir'] do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

# the default configuration for the foobar application
template '/etc/defaults/foobar' do
  source 'foobar.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    :foobar_home => node['foobar']['home_dir']
  )
end
