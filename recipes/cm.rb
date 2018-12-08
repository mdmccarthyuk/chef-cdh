#
# Cookbook:: cdh
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

yum_repository 'cloudera-manager' do
	description "Cloudera Manager Repo"
	baseurl node['cdh']['cm']['repo']
	gpgkey node['cdh']['cm']['repokey']
	action :create
end

node['cdh']['cm']['packages'].each { |rpm| package rpm }

execute 'configure-database' do
	command '/opt/cloudera/cm/schema/scm_prepare_database.sh -h pgdb postgresql scm scm --scm-password-script sync; touch /tmp/done_configure_db'
	not_if { ::File.exists?("/tmp/done_configure_db")}
end

service 'cloudera-scm-server' do
	supports :status => true, :restart => true, :reload => true
	action [ :enable, :start ]
end

service 'cloudera-scm-agent' do
	supports :status => true, :restart => true, :reload => true
	action [ :enable, :start ]	
end

#ruby_block ":: Setting parcels repository" do
#  block do
#    rest_call(:put, "http://127.0.0.1:7180/api/v9/cm/config", { :items => [ { :name => "REMOTE_PARCEL_REPO_URLS", :values => node['cdh']['cm']['parcels'].join(",") } ] }.to_json )
#  end
#end