#
# Cookbook Name:: placefull-elasticsearch-2
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

override["java"]["oracle"]["accept_oracle_download_terms"] = true
override["java"]["accept_license_agreement"] = true

default["java"]["install_flavor"] = "oracle"
default["java"]["jdk_version"] = "8"

