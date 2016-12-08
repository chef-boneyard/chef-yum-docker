require 'spec_helper'

describe 'chef-yum-docker::default' do
  context 'default attributes' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'centos', version: '6.8').converge(described_recipe)
    end

    it 'creates the yum repo' do
      expect(chef_run).to create_yum_repository('docker')
    end
  end

  context 'managed attribute set to false' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'centos', version: '6.8') do |node|
        node.override['yum']['docker']['managed'] = false
      end.converge(described_recipe)
    end

    it 'does not create the yum repo' do
      expect(chef_run).to_not create_yum_repository('docker')
    end
  end
end
