# placefull-elasticsearch-5.0

Chef cookbook for installing Elasticsearch v5.0, kibana, x-pack and nginx on AWS Opsworks



Setting up opworks


Create a stack with CHEF 12 and Amazon linux.  Make sure it has IAM user of placefull-search-? Which ever one you are launching.

The custom JSON in Stack Settings needs to have
{ 
"java":{
"install_flavor":"oracle",
"jdk_version":"8",
"oracle": {
"accept_oracle_download_terms":"true"
}
}
}


Repo url is https://github.com/placefull/placefull-elasticsearch-5.0.git

Set it to be us-east-1b   if you want to change this, then you need to also change the elasticsearch configuration in the default.rb 
because it points the discovery to us-east-1b

Add a layer and call it search

Under Layer > Settings > Recipes add placefull-elasticsearch-5 as a recipe in the setup section

Under Layer > Settings>Security add placefull-search-dev-elasticsearchdev-1EVUH9PHA9WXI or staging prod


Launch 3 instances in the stack together.  You need to launch a minimum of three, no max.

Once they come up, navigate to ipaddress:8080

user is placefull
password is "to be added"


This is the endpoint for elasticsearch

navigate to ipaddress:8181

same user:pass

This is the endpoint for kibana

