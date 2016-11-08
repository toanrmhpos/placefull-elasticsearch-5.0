#
# Cookbook Name:: placefull-elasticsearch-2
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

default["java"]["install_flavor"] = "oracle"
default["java"]["jdk_version"] = "8"
default["java"]["oracle"]["accept_oracle_download_terms"] = true
