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
stack = search(:aws_opsworks_stack).first

elasticsearch_user 'elasticsearch'
elasticsearch_install 'elasticsearch' do
type 'package'
end
elasticsearch_configure 'elasticsearch' do
#only install this production level Recipe on t2.medium or larger!
allocated_memory '1024m'
configuration ({
'cluster.name' => 'placefull-search-staging-cluster-50',
'node.name' => "#{instance['hostname']}",
'node.master' => 'true',
'node.data' => 'true',
'bootstrap.memory_lock' => 'true',
'network.host' => '_ec2:privateIp_',
'http.cors.enabled' => 'true',
'http.cors.allow-origin' => '*',
'http.host' => '127.0.0.1',
'plugin.mandatory' => 'discovery-ec2',
'discovery.type' => 'ec2',
'discovery.zen.minimum_master_nodes' => '2',
'discovery.ec2.tag.opsworks:stack' => "#{stack['name']}",
'cloud.node.auto_attributes' => 'true',
'cloud.aws.region' => 'us-east-1',
'action.auto_create_index' => '.security,.monitoring*,.watches,.triggered_watches,.watcher-history*',
'xpack.security.enabled' => 'false' 
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


include_recipe "placefull-kibana"

