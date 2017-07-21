describe yum.repo('docker-stable') do
  it { should exist }
  it { should be_enabled }
end

describe yum.repo('docker-edge') do
  it { should exist }
  it { should_not be_enabled }
end

describe yum.repo('docker-test') do
  it { should exist }
  it { should_not be_enabled }
end

describe package('docker-ce') do
  it { should be_installed }
end
