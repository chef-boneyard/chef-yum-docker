default['yum']['docker']['baseurl'] = case node['platform']
                                      when 'amazon'
                                        'https://yum.dockerproject.org/repo/main/centos/6/'
                                      when 'oracle'
                                        "https://yum.dockerproject.org/repo/main/oraclelinux/#{node['platform_version'].to_i}/"
                                      when 'fedora'
                                        "https://yum.dockerproject.org/repo/main/fedora/#{node['platform_version'].to_i}/"
                                      else
                                        "https://yum.dockerproject.org/repo/main/centos/#{node['platform_version'].to_i}/"
                                      end

default['yum']['docker']['description'] = 'Docker Respository'
default['yum']['docker']['gpgkey'] = 'https://yum.dockerproject.org/gpg'
default['yum']['docker']['gpgcheck'] = true
default['yum']['docker']['enabled'] = true
default['yum']['docker']['managed'] = true
