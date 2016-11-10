#
# Cookbook Name:: placefull-elasticsearch-2
# Recipe:: default
# Uses the elasticsearch cookbook provided by elastic.co to install elasticsearch
# Requires Chef 12.0+

# Copyright (c) 2016 The Authors, All Rights Reserved.

#  While the Java recipe is referenced here to install Java, you must also add the following to the Opsworks
# Stack > Stack Settings > Custom JSON field when creating the stack
# { 
# "java":{
#       "install_flavor":"oracle",
#       "jdk_version":"8",
#       "oracle": {
#                "accept_oracle_download_terms":"true"
#                 }
#         }
# }
#
#
#
#
#
#

include_recipe "java"
include_recipe "placefull-nginx"

instance = search(:aws_opsworks_instance, "self:true").first
elasticsearch_user 'elasticsearch'
elasticsearch_install 'elasticsearch' do
type 'package'
end
elasticsearch_configure 'elasticsearch' do
allocated_memory '512m'
configuration ({
'cluster.name' => 'placefull-staging-es-50',
'node.name' => "#{instance['hostname']}",
'node.master' => 'true',
'node.data' => 'true',
'bootstrap.memory_lock' => 'true',
'network.host' => '_ec2:privateIp_',
'http.host' => '127.0.0.1',
'plugin.mandatory' => 'discovery-ec2',
'discovery.type' => 'ec2',
'discovery.zen.minimum_master_nodes' => '2',
'cloud.node.auto_attributes' => 'true',
'cloud.aws.region' => 'us-east-1',
'sheild.enabled' => 'false' 
})
end

elasticsearch_plugin 'discovery-ec2' do
  action :install
end

elasticsearch_plugin 'x-pack' do
  action :install
end

elasticsearch_service 'elasticsearch' do
service_actions [:enable, :start]
end



#elasticsearch_plugin 'head' do
#url 'mobz/elasticsearch-head'
#notifies :restart, 'elasticsearch_service[elasticsearch]', :delayed
#end

