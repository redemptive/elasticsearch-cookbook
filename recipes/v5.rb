#
# Cookbook:: elasticsearch
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
execute 'Get java repository' do 
	command 'sudo add-apt-repository -y ppa:webupd8team/java'
end

execute 'update' do
	command "sudo apt update"
end

package "language-pack-en"

execute "accept-license" do
 command "echo debconf shared/accepted-oracle-license-v1-1 select true | \
 sudo debconf-set-selections"
end

execute "config java" do
	command "echo debconf shared/accepted-oracle-license-v1-1 seen true | \
 sudo debconf-set-selections"
end

package "oracle-java8-installer"

execute 'Get key' do
	command  'wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -'
end

package 'apt-transport-https'

execute 'Save repo definition' do
	command  'echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list'
end

apt_update

package 'elasticsearch'

service 'elasticsearch' do
	action [:enable, :start]
end