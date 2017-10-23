#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
# Install apache package
package 'apache2' do
	package_name 'httpd'
	action :install
end

service 'apache2' do
	service_name 'httpd'
	action [:start, :enable]
end

Chef.event_handler do
  on :run_failed do
    HandlerSendEmail::Helper.new.send_email_on_run_failure(
      Chef.run_context.node.name
    )
  end
end

Chef.event_handler do
  on :run_completed do
    HandlerSendEmail::Helper.new.send_email_on_run_complete(
      Chef.run_context.node.name
    )
  end
end

# include_recipe 'apache::websites'

