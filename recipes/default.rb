#
# Cookbook Name:: chef-yum-docker
# Recipe:: default
#
# Copyright 2016, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

docker_repo_url = case node['platform']
                  when 'amazon'
                    'https://yum.dockerproject.org/repo/main/centos/6/'
                  when 'oracle'
                    "https://yum.dockerproject.org/repo/main/oraclelinux/#{node['platform_version'].to_i}/"
                  when 'fedora'
                    "https://yum.dockerproject.org/repo/main/fedora/#{node['platform_version'].to_i}/"
                  else
                    "https://yum.dockerproject.org/repo/main/centos/#{node['platform_version'].to_i}/"
                  end

yum_repository 'dockerrepo' do
  description 'Docker Respository'
  baseurl docker_repo_url
  gpgkey 'https://yum.dockerproject.org/gpg'
  action :create
end
