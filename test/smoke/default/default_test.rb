# # encoding: utf-8

# Inspec test for recipe elasticsearch::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe package('apt-transport-https') do
	it {should be_installed}
end

describe package('elasticsearch') do
	it {should be_installed}
end

describe service('elasticsearch') do
	it {should be_running}
	it {should be_enabled}
end