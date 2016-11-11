#
# Cookbook Name:: placefull-nginx
# Recipe:: default

#  Installs Nginx and sets it up to act as a password protected HTTP proxy for Elasticsearch
 
# Copyright (c) 2016 PlaceFull Inc., All Rights Reserved.


package 'nginx' do
  action :install
end

#copies over the file found in /files/default/nginx.conf

cookbook_file "/etc/nginx/nginx.conf" do
  source "nginx.conf"
  mode "0644"
end

#copies over the file found in /files/default/htpasswd

#if you wish to change the user/password combo found in the htpasswd file do this on an Amazon linux box. 
#Then copy and paste the contents of the generated htpasswd file.
#placefull is the user

#cd ~
#yum install httpd-tools
#htpasswd -c htpasswd placefull


cookbook_file "/etc/nginx/.htpasswd" do
  source "htpasswd"
  mode "0644"
end


service 'nginx' do
  supports status: true, restart: true, reload: true
  action [ :enable, :restart ]
end


