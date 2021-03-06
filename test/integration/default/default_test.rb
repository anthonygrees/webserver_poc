# # encoding: utf-8

# Inspec test for recipe webserver::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# This is an example test, replace it with your own test.
describe port(8080) do
  it { should be_listening }
end

# The use of curl is a terrible way to test!
describe command('curl localhost:8080') do
  its('stdout') { should match ('Hello, world')}
end

describe http('http://localhost:8080') do
  its('status') { should cmp 200 }
  its('body') { should eq '<h1>Hello, world!</h1>\n' }
end


control 'Linux VERSION' do
  impact 0.8
  title 'This test checks for a minimum Linux version'

  describe os.family do
    it { should eq 'redhat' }
  end

  describe os.name do
    it { should eq 'centos' }
  end

  describe os.release do
    it { should > '6' }
  end
end
