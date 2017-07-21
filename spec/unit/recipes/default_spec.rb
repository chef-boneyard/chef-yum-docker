require 'spec_helper'

describe 'chef-yum-docker::default' do
  context 'default attributes' do
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
