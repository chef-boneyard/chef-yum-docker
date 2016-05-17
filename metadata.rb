name 'chef-yum-docker'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache 2.0'
description 'Sets up the Docker yum repository'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.0.1'

recipe 'chef-yum-docker::default', 'Sets up the Docker apt repository.'

%w(centos redhat scientific oracle amazon fedora).each do |os|
  supports os
end

depends 'yum', '>= 3.0.0'

source_url 'https://github.com/chef-cookbooks/chef-yum-docker'
issues_url 'https://github.com/chef-cookbooks/chef-yum-docker/issues'
