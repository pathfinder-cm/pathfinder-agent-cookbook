# # encoding: utf-8

# Inspec test for recipe pathfinder-agent::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe directory('/opt') do
  its('mode') { should cmp '0755' }
end

describe directory('/opt/bin') do
  its('mode') { should cmp '0755' }
end

describe directory('/var/cache/chef') do
  its('mode') { should cmp '0755' }
end

describe file('/opt/bin/pathfinder-agent') do
  its('mode') { should cmp '0755' }
end

describe systemd_service('pathfinder-agent') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end
