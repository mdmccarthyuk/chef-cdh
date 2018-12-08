#
# Cookbook:: cdh
# Recipe:: agent
#
# Copyright:: 2018, The Authors, All Rights Reserved.

yum_repository 'cloudera-manager' do
	description "Cloudera Manager Repo"
	baseurl node['cdh']['cm']['repo']
	gpgkey node['cdh']['cm']['repokey']
	action :create
end

node['cdh']['agent']['packages'].each { |rpm| package rpm }

template '/etc/cloudera-scm-agent/config.ini' do
	source 'agent_config.erb'
end

service 'cloudera-scm-agent' do
	supports :status => true, :restart => true, :reload => true
	action [ :enable, :start ]	
end
