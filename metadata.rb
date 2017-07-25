name 'chef-yum-docker'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache-2.0'
description 'Sets up the Docker yum repository'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '2.2.0'

recipe 'chef-yum-docker::default', 'Sets up the Docker yum repository.'

%w(centos redhat scientific fedora).each do |os|
  supports os
end

source_url 'https://github.com/chef-cookbooks/chef-yum-docker'
issues_url 'https://github.com/chef-cookbooks/chef-yum-docker/issues'
chef_version '>= 12.14' if respond_to?(:chef_version)
