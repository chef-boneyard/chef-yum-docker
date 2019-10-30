name 'chef-yum-docker'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache-2.0'
description 'Sets up the Docker yum repository'
version '3.1.1'

%w(centos redhat scientific oracle fedora).each do |os|
  supports os
end

source_url 'https://github.com/chef-cookbooks/chef-yum-docker'
issues_url 'https://github.com/chef-cookbooks/chef-yum-docker/issues'
chef_version '>= 12.14'
