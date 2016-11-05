#
# Cookbook Name:: placefull-elasticsearch-2
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

elasticsearch_user 'elasticsearch'
elasticsearch_install 'elasticsearch' do
type :package
end
elasticsearch_configure 'elasticsearch' do
allocated_memory '1g'
configuration ({
'cluster.name' => 'placefull-es-2',
'node.name' => 'node01'
})
end

elasticsearch_service 'elasticsearch' do
service_actions [:enable, :start]
end

elasticsearch_plugin 'head' do
url 'mobz/elasticsearch-head'
notifies :restart, 'elasticsearch_service[elasticsearch]', :delayed
end
