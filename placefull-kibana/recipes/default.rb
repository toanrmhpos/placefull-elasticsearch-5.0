#
# Cookbook Name:: placefull-kibana
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


execute 'get-kibana' do
   command 'wget https://artifacts.elastic.co/downloads/kibana/kibana-5.0.0-x86_64.rpm'
end

execute 'remove-kibana' do
   command 'sudo rpm -e kibana'
   ignore_failure true
end

execute 'install-kibana' do
   command 'sudo rpm --install kibana-5.0.0-x86_64.rpm'
end

execute 'install-kibana-xpack' do
   command '/usr/share/kibana/bin/kibana-plugin install x-pack'
end

#copies over the file found in /files/default/kibana.yml

cookbook_file "/etc/kibana/kibana.yml" do
  source "kibana.yml"
  mode "0644"
end

service 'kibana' do
  action :enable
end

service 'kibana' do
  action :start
end




