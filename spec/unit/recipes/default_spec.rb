require 'spec_helper'

describe 'chef-yum-docker::default' do
  context 'default attributes on Amazon Linux' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'amazon', version: '2017.09').converge(described_recipe)
    end

    it 'warns that this platform is not suppored' do
      expect(chef_run).to write_log('The chef-yum-docker cookbook only supports RHEL 7+ and Fedora! Skipping.')
    end
  end

  context 'default attributes on CentOS 6' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'centos', version: '6.9').converge(described_recipe)
    end

    it 'warns that this platform is not suppored' do
      expect(chef_run).to write_log('The chef-yum-docker cookbook only supports RHEL 7+ and Fedora! Skipping.')
    end
  end

  context 'default attributes on Ubuntu 16.04' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe)
    end

    it 'warns that this platform is not suppored' do
      expect(chef_run).to write_log('The chef-yum-docker cookbook only supports RHEL 7+ and Fedora! Skipping.')
    end
  end

  context 'default attributes on CentOS 7' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'centos', version: '7.3.1611').converge(described_recipe)
    end

    it 'creates the yum repo docker-stable' do
      expect(chef_run).to create_yum_repository('docker-stable')
    end

    it 'creates the yum repo docker-edge' do
      expect(chef_run).to create_yum_repository('docker-edge')
    end

    it 'creates the yum repo docker-test' do
      expect(chef_run).to create_yum_repository('docker-test')
    end
  end

  context 'managed attribute set to false' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'centos', version: '7.3.1611') do |node|
        node.override['yum']['docker-test']['managed'] = false
      end.converge(described_recipe)
    end

    it 'does not create the yum repo' do
      expect(chef_run).to_not create_yum_repository('docker-test')
    end
  end
end
