# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "benjamin"
client_key               "#{current_dir}/benjamin.pem"
chef_server_url          "https://itzbenji2.mylabserver.com/organizations/ctstech"
cookbook_path            ["#{current_dir}/../cookbooks"]
