name 'placefull-elasticsearch-2'
maintainer 'PlaceFull Inc.'
maintainer_email 'dev@placefull.com'
license 'all_rights'
description 'Uses the elasticsearch cookbook provided by elastic.co to install elasticsearch'
long_description 'Uses the elasticsearch cookbook provided by elastic.co to install elasticsearch'
version '0.1.0'
depends 'java'
# this installs ES v5.0. The Cookbook is V3.0.1
depends 'elasticsearch', '= 3.0.1'
depends 'placefull-nginx'
depends 'placefull-kibana'



# If you upload to Supermarket you should set this so your cookbook
# gets a `View Issues` link
# issues_url 'https://github.com/<insert_org_here>/placefull-elasticsearch-2/issues' if respond_to?(:issues_url)

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Source` link
# source_url 'https://github.com/<insert_org_here>/placefull-elasticsearch-2' if respond_to?(:source_url)
