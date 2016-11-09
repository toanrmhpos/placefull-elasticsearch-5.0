#
# Cookbook Name:: placefull-nginx
# Recipe:: default

#  Installs Nginx and sets it up to act as a password protected HTTP proxy for Elasticsearch
 
# Copyright (c) 2016 PlaceFull Inc., All Rights Reserved.


package 'nginx' do
  action :install
end

cookbook_file "/etc/nginx/nginx.conf" do
  source "nginx.conf"
  mode "0644"
end

cookbook_file "/etc/nginx/.htpasswd" do
  source "htpasswd"
  mode "0644"
end


service 'nginx' do
  supports status: true, restart: true, reload: true
  action [ :enable, :restart ]
end


