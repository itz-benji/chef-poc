#
# Cookbook:: email-handler
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
 
include_recipe 'chef_handler'

# handler_path = node['chef_handler']['handler_path']
# handler = ::File.join handler_path, 'send_email'

chef_handler 'Chef::Handler::JsonFile' do
    source 'chef/handler/json_file'
    arguments path: '/var/chef/reports'
    action :enable
  end

  # do the same but during the compile phase
  chef_handler 'Chef::Handler::JsonFile' do
    source 'chef/handler/json_file'
    arguments path: '/var/chef/reports'
    action :nothing
  end.run_action(:enable)

  # handle exceptions only
  chef_handler 'Chef::Handler::JsonFile' do
    source 'chef/handler/json_file'
    arguments path: '/var/chef/reports'
    type exception: true
    action :enable
  end

  # enable the MyCorp::MyLibraryHandler handler which was dropped off in a
  # standard chef library file.
#  chef_handler 'MyCorp::MyLibraryHandler' do
#    action :enable
#  end

include_recipe 'email-handler::send_email'

#handler_path = node['chef_handler']['handler_path']
#handler = ::File.join handler_path, 'send_email'

#cookbook_file "#{handler}.rb" do
#  source 'send_email.rb'
#  owner 'root'
#  group 'root'
#  mode '0755'
#  action :create
#end

#chef_handler 'Test::SendEmail' do
#  source handler
#  action :enable
#end

